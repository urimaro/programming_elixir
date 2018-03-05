defmodule MyList do
  def caesar([], _n), do: []
  def caesar([head | tail], n) do
    [?a + rem(head + n - ?a, 26) | caesar(tail, n)]
  end
end

