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
end

