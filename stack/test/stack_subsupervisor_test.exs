defmodule Stack.SubSupervisorTest do
  use ExUnit.Case
  doctest Stack.SubSupervisor

  import Stack.Server

  test "restart a process" do
    pop()
    raise()

    :timer.sleep(1000)

    first = pop()
    second = pop()
    assert [first, second] == ["cat", 9]
  end
end

