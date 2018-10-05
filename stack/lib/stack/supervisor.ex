defmodule Stack.Supervisor do
  use Supervisor

  def start_link(initial_data) do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [initial_data])
    start_workers(sup, initial_data)
    result
  end

  def start_workers(sup, initial_data) do
    # Start stash worker
    {:ok, stash} = Supervisor.start_child(sup, worker(Stack.Stash, [initial_data]))

    # Start sub supervisor
    Supervisor.start_child(sup, supervisor(Stack.SubSupervisor, [stash]))
  end

  def init(_) do
    supervise([], strategy: :one_for_one)
  end
end

