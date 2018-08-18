defmodule Token do
  def send_token do
    receive do
      {sender, token} ->
        send sender, {:ok, token}
        send_token()
    end
  end

  def run(n) do
    Enum.each(1..n, fn _ ->
      pid_1st = spawn(Token, :send_token, [])
      send pid_1st, {self(), "fred"}
      receive do
        {:ok, token} ->
          IO.puts "The token is #{token}"
      end

      pid_2nd = spawn(Token, :send_token, [])
      send pid_2nd, {self(), "betty"}
      receive do
        {:ok, token} ->
          IO.puts "The token is #{token}"
      end
    end)
  end
end

