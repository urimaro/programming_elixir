defmodule Stack.Server do
  use GenServer

  #####
  # 外部 API

  def start_link(stash_pid) do
    GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(value) do
    GenServer.cast(__MODULE__, {:push, value})
  end

  def stop do
    GenServer.cast(__MODULE__, :stop)
  end

  def invalid_value do
    GenServer.cast(__MODULE__, :invalid_value)
  end

  def halt_0 do
    GenServer.cast(__MODULE__, {:halt, 0})
  end

  def halt_1 do
    GenServer.cast(__MODULE__, {:halt, 1})
  end

  def halt_abort do
    GenServer.cast(__MODULE__, {:halt, :abort})
  end

  def kernel_exit_normal do
    GenServer.cast(__MODULE__, {:kernel_exit, :normal})
  end

  def kernel_exit_shutdown do
    GenServer.cast(__MODULE__, {:kernel_exit, :shutdown})
  end

  def kernel_exit_other do
    GenServer.cast(__MODULE__, {:kernel_exit, "I wanna exit Kernel!"})
  end

  def raise do
    GenServer.cast(__MODULE__, {:raise, "I've raised!"})
  end

  #####
  # GenServerの実装

  def init(stash_pid) do
    current_stack = Stack.Stash.get_stack(stash_pid)
    {:ok, {current_stack, stash_pid}}
  end

  def handle_call(:pop, _from, {[head | tail], stash_pid}) do
    {:reply, head, {tail, stash_pid}}
  end

  def handle_cast(request, {state, stash_pid}) do
    case request do
      request when is_atom(request) and request == :stop ->
        {:stop, "That's the stop reason!", state}
      request when is_atom(request) and request == :invalid_value ->
        {}
      {id, value} when id == :halt ->
        System.halt(value)
      {id, value} when id == :kernel_exit ->
        Kernel.exit(value)
      {id, value} when id == :raise ->
        raise value
      {id, value} when id == :push ->
        {:noreply, {[value | state], stash_pid}}
    end
  end

  def terminate(reason, {state, stash_pid}) do
    IO.puts "Here is the terminate callback!"
    IO.puts "Reason: #{inspect reason}"
    IO.puts "State: #{inspect state}"
    Stack.Stash.save_stack(stash_pid, state)
  end
end

