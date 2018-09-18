defmodule Ticker do
  @interval 2000  # 2 seconds
  @name     :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[], nil])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), {:register, client_pid}
  end

  def generator(clients, current) when is_nil(current) do
    receive do
      {:register, pid} ->
        IO.puts "registering #{inspect pid}"
        generator([pid | clients], 0)
    after
      @interval ->
        IO.puts "tick"
        generator(clients, current)
    end
  end

  def generator(clients, current) do
    receive do
      {:register, pid} ->
        IO.puts "registering #{inspect pid}"
        generator([pid | clients], current)
    after
      @interval ->
        IO.puts "tick"
        client = clients
                 |> Enum.reverse
                 |> Enum.at(current)
        IO.puts "send to #{inspect client}"
        send client, {:tick}
        generator(clients, _get_current(current + 1, clients))
    end
  end

  defp _get_current(current, clients) when current >= length(clients), do: 0
  defp _get_current(current, _), do: current
end

defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      {:tick} ->
        IO.puts "tock in client"
        receiver()
    end
  end
end

