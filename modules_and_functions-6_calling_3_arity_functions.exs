defmodule Chop do
  def guess(n, a..b) do
    guess(n, a..b, middle(a, b))
  end

  defp guess(expect, _, expect) do
    IO.puts "It is #{expect}"
  end

  defp guess(n, a.._, expect) when n < expect do
    IO.puts "It is #{expect}"
    guess(n, a..(expect - 1), middle(a, expect))
  end

  defp guess(n, _..b, expect) when n > expect do
    IO.puts "It is #{expect}"
    guess(n, (expect + 1)..b, middle(expect, b))
  end

  defp middle(a, b) do
    a + div(b - a, 2)
  end
end

