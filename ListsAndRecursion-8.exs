defmodule Order do
  def add_total_amount(tax_rates, orders) do
    for order <- orders do
      total_amount = _total(order[:net_amount], tax_rates, order[:ship_to])
      Keyword.merge(order, [total_amount: total_amount])
    end
  end

  defp _total(net, tax_rates, state), do: net * (1.0 + _tax_rate(tax_rates, state))
  defp _tax_rate(tax_rates, state), do: Keyword.get(tax_rates, state, 0.0)
end
