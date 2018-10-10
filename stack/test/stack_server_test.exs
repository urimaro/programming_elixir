defmodule Stack.ServerTest do
  use ExUnit.Case
  doctest Stack.Server

  import Stack.Server

  test "pop the last element" do
    assert pop() == List.first([5, "cat", 9])
  end
end
