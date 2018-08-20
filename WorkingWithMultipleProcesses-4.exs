defmodule LinkWithExit do
  def sad_function do
    receive do
      {sender} ->
        send sender, {:ok, "Good bye!"}
        raise RuntimeError, message: "Raise an exception"
    end
  end

  def receive_message do
    receive do
      {:ok, message} ->
        IO.puts message
        receive_message()
    after 2000 ->
      IO.puts "Nothing happend as far as I am concerned"
    end
  end

  def run do
    child_pid = spawn_link(LinkWithExit, :sad_function, [])
    send child_pid, {self()}

    :timer.sleep(500)

    receive_message()
  end
end

LinkWithExit.run()

