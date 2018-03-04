defmodule MyList do
  def max([]),            do: IO.puts "Nothing coz there is no element."
  def max([head | tail]), do: _max(tail, head)

  defp _max([], value),                               do: value
  defp _max([head | tail], value) when head > value,  do: _max(tail, head)
  defp _max([head | tail], value) when head <= value, do: _max(tail, value)
end

