defmodule Token do
  def send_token do
    receive do
      {sender, token} ->
        send sender, {:ok, token}
        send_token()
    end
  end

  def create_process(pid, token) do
    send pid, {self(), token}
    receive do
      {:ok, token} ->
        IO.puts "The token is #{token}"
    end
  end

  def run(n) do
    pid_1st = spawn(Token, :send_token, [])
    pid_2nd = spawn(Token, :send_token, [])

    Enum.each(1..n, fn _ ->
      create_process(pid_1st, "fred")
      create_process(pid_2nd, "betty")
    end)
  end
end

