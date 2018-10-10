defmodule Stack.StashTest do
  use ExUnit.Case
  doctest Stack.Stash

  import Stack.Stash

  test "get the list from the stash" do
    {:ok, pid} = start_link(["cat", 3, "dog"])

    assert get_stack(pid) == ["cat", 3, "dog"]
  end

  test "save a list to the stash" do
    {:ok, pid} = start_link([])
    assert get_stack(pid) == []

    save_stack(pid, ["cat", 3, "dog"])
    assert get_stack(pid) == ["cat", 3, "dog"]
  end
end

