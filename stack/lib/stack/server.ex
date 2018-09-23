defmodule Stack.Server do
  use GenServer

  def handle_call(:pop, _form, [head | tail]) do
    {:reply, head, tail}
  end
end

