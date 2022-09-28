defmodule Pledge.NIF do
  use Rustler, otp_app: :pledge, crate: "pledge_nif"
  def pledge_promises(_s), do: :erlang.nif_error(:nif_not_loaded)
  def pledge_execpromises(_s), do: :erlang.nif_error(:nif_not_loaded)
  def pledge(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
