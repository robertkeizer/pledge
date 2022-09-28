defmodule Pledge do
  @moduledoc """
  This module provides an interface to the [pledge(2)](https://man.openbsd.org/pledge) system call.

  [pledge(2)](https://man.openbsd.org/pledge) restricts operations the current operating system process (the BEAM) can perform. It is possible to crash the BEAM by restricting access to required resources.
  """
  @moduledoc since: "0.0.1"

  alias Pledge.NIF

  @typedoc """
  The shape of the result for `pledge/2`, `pledge_promises/1`, and `pledge_execpromises/1`.
  """
  @type pledge_result ::
          :ok | {:error, :einval} | {:error, :eperm} | {:error, :efault} | {:error, :error}

  @typedoc """
  A space separated string. See [pledge(2)](https://man.openbsd.org/pledge) for details.
  """
  @type promises :: String.t()

  @typedoc """
  A space separated string. See [pledge(2)](https://man.openbsd.org/pledge) for details.
  """
  @type execpromises :: String.t()

  @doc false
  defp to_ex(nif_response) do
    case nif_response do
      {:ok, _} -> :ok
      {:error, detail} -> {:error, detail}
      _ -> {:error, :invalid_nif_response}
    end
  end

  @doc """
  Calls pledge with both `promises` and `execpromises`.

  WARNING: Calling this with some promises can result in the BEAM being killed!

  Basic usage:
  ```elixir
  :ok = pledge("stdio rpath wpath cpath vminfo ps error", "exec")
  ```
  Errors defined in [the manual](https://man.openbsd.org/pledge) are exposed via atoms.
  ```elixir
  {:error, :einval} = pledge("invalid_promise", "exec")
  ```
  """
  @spec pledge(String.t(), String.t()) :: pledge_result
  def pledge(promises, execpromises) do
    to_ex(NIF.pledge(promises, execpromises))
  end

  @doc """
  Calls pledge with specific `promises`.
  """
  @spec pledge_promises(String.t()) :: pledge_result
  def pledge_promises(promises) do
    to_ex(NIF.pledge_promises(promises))
  end

  @doc """
  Calls pledge with specific `execpromises`.
  """
  @spec pledge_execpromises(String.t()) :: pledge_result
  def pledge_execpromises(execpromises) do
    to_ex(NIF.pledge_execpromises(execpromises))
  end
end
