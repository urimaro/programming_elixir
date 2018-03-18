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
end

