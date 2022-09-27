defmodule PledgeTest do
  use ExUnit.Case
  doctest Pledge

  test "greets the world" do
    assert Pledge.hello() == :world
  end
end
