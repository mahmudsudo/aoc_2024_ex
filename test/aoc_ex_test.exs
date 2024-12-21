defmodule AocExTest do
  use ExUnit.Case
  doctest AocEx

  test "greets the world" do
    assert AocEx.hello() == :world
  end
end
