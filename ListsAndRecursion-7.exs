defmodule MyList do
  def span(from, to) when from > to, do: []
  def span(from, to) do
    [from | span(from + 1, to)]
  end

  def prime(n) do
    range = span(2, n)
    range -- for x <- range, y <- range, x >= y, x * y <= n, do: x * y
  end
end
