defmodule EnumTake do
  def take(list, count) when count < 0 do
    IO.inspect Enum.reverse(list)
    take_one(Enum.reverse(list), count * (-1), [])
  end
  def take(list, count) do
    take_one(list, count, [])
  end

  defp take_one(_list, 0, result) do
    Enum.reverse(result)
  end
  defp take_one([], _count, result) do
    Enum.reverse(result)
  end
  defp take_one([head | tail], count, result) do
    take_one(tail, count - 1, [head | result])
  end
end

