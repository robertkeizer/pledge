defmodule PledgeTest.NIF do
  use ExUnit.Case
  doctest Pledge.NIF

  alias Pledge.NIF

  describe "pledge_promises/1" do
    test "Returns {:error, :einval} for invalid input" do
      assert {:error, :einval} = NIF.pledge_promises("invalid_input")
    end

    test "Returns {:ok, :ok} for valid input" do
      assert {:ok, :ok} = NIF.pledge_promises("stdio rpath wpath cpath vminfo ps error")
    end
  end

  describe "pledge_execpromises/1" do
    test "Returns {:error, :einval} for invalid input" do
      assert {:error, :einval} = NIF.pledge_execpromises("invalid_input")
    end

    test "Returns {:ok, :ok} for valid input" do
      assert {:ok, :ok} = NIF.pledge_execpromises("exec")
    end
  end

  describe "pledge/2" do
    test "Returns {:error, :einval} for invalid input" do
      assert {:error, :einval} = NIF.pledge("invalid_input", "invalid_input")
    end

    test "Returns {:ok, :ok} for valid input" do
      assert {:ok, :ok} = NIF.pledge("stdio rpath wpath cpath vminfo ps error", "exec")
    end
  end
end
