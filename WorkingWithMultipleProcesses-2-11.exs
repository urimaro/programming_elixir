defmodule Token do
  def send_token do
    receive do
      {sender, token} ->
        send sender, {:ok, token}
#     {:ok, token} ->
#       IO.puts "token is #{token}"
    end
  end

  def create_processes(token) do
    pid = spawn(Token, :send_token, [])
    send pid, {self, token}

    receive do
      {:ok, token} ->
        IO.puts "The token is #{token}"
    end
  end

  def run(n) do
    Enum.each(1..n, fn _ ->
      create_processes("fred")
      create_processes("betty")
    end)
  end
end

