defmodule MyList do
  def flatten(list), do: flatten(list, [])

  defp flatten([head | tail], result) when is_list(head) do
    flatten(head, flatten(tail, result))
  end

  defp flatten([head | tail], result) do
    [head | flatten(tail, result)]
  end

  defp flatten([], result), do: result
end
