defmodule PledgeTest do
  use ExUnit.Case
  doctest Pledge

  describe "pledge_promises/1" do
    test "Returns {:error, :einval} for invalid input" do
      assert {:error, :einval} = Pledge.pledge_promises("invalid_input")
    end

    test "Returns :ok for valid input" do
      assert :ok = Pledge.pledge_promises("stdio rpath wpath cpath vminfo ps error")
    end
  end

  describe "pledge_execpromises/1" do
    test "Returns {:error, :einval} for invalid input" do
      assert {:error, :einval} = Pledge.pledge_execpromises("invalid_input")
    end

    test "Returns :ok for valid input" do
      assert :ok = Pledge.pledge_execpromises("exec")
    end
  end

  describe "pledge/2" do
    test "Returns {:error, :einval} for invalid input" do
      assert {:error, :einval} = Pledge.pledge("invalid_input", "invalid_input")
    end

    test "Returns {:ok, :ok} for valid input" do
      assert :ok = Pledge.pledge("stdio rpath wpath cpath vminfo ps error", "exec")
    end
  end
end
