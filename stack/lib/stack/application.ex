defmodule Stack.Application do
  @moduledoc false

  use Application

  # args: list
  def start(_type, args) do
    children = [
      {Stack.Server, args}
    ]

    opts = [strategy: :one_for_one, name: Stack.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

