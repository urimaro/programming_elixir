defmodule Token do
  def send_token do
    receive do
      {sender, token} when token == "fred" ->
        :timer.sleep(3000)
        send sender, {:ok, token}
        send_token()
      {sender, token} ->
        send sender, {:ok, token}
        send_token()
    end
  end

  def run do
    pid_1st = spawn(Token, :send_token, [])
    pid_2nd = spawn(Token, :send_token, [])

    send pid_1st, {self(), "fred"}

    receive do
      {:ok, token} ->
        IO.puts "The token is #{token}"
    end

    send pid_2nd, {self(), "betty"}
    receive do
      {:ok, token} ->
        IO.puts "The token is #{token}"
    end
  end
end

