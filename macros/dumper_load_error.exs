defmodule My do
  def hello do
    IO.puts "Hello!"
  end

  defmacro macro(param) do
    IO.inspect param
  end
end

require My

My.hello()
My.macro :atom

