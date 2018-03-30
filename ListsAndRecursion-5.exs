defmodule ListsAndRecursion do
  # all?
  def all?(list), do: all?(list, &(!!&1))

  def all?([], _func), do: true
  def all?([head | tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  # each
  def each([], _func), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  # filter
  def filter([], _func), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  # split
  def split(list, count), do: _split(list, [], count)

  defp _split([],   front, _count), do: {Enum.reverse(front), []}
  defp _split(list, front, 0),      do: {Enum.reverse(front), list}
  defp _split([head | tail], front, count) when count > 0 do
    _split(tail, [head | front], count - 1)
  end
  defp _split(list, front, count) when count < 0 do
    _split(list, front, max(0, Enum.count(list) + count))
  end

  # take
  def take(list, count) when count >= 0, do: Enum.split(list, count) |> elem(0)
  def take(list, count) when count < 0,  do: Enum.split(list, count) |> elem(1)
end

