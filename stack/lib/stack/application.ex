defmodule Stack.Application do
  @moduledoc false

  use Application

  # args: list
  def start(_type, _args) do
    {:ok, _pid} = Stack.Supervisor.start_link(Application.get_env(:stack, :initial_value))
  end
end

