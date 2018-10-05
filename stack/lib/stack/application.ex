defmodule Stack.Application do
  @moduledoc false

  use Application

  # args: list
  def start(_type, args) do
    {:ok, _pid} = Stack.Supervisor.start_link(args)
  end
end

