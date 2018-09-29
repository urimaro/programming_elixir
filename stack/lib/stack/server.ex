defmodule Stack.Server do
  use GenServer

  def start_link(list) do
    GenServer.start_link(__MODULE__, list, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(value) do
    GenServer.cast(__MODULE__, {:push, value})
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, value}, stack) do
    {:noreply, [value | stack]}
  end

  def handle_cast(:stop, state) do
    {:stop, "That's the stop reason!", state}
  end

  def handle_cast(:invalid_value, _state) do
    {}
  end

  def handle_cast({:halt, value}, _state) do
    System.halt(value)
  end

  def handle_cast({:kernel_exit, reason}, _state) do
    Kernel.exit(reason)
  end

  def handle_cast({:raise, reason}, _state) do
    raise reason
  end
end

