defmodule StringsAndBinaries do
  def calculate([]), do: []
  def calculate(expression) when is_list expression do
    {num1, rest} = _parse_number({0, expression})
    {op,   rest} = _parse_operator(rest)
    {num2, _}    = _parse_number({0, rest})

    _calc(op, num1, num2)
  end

  defp _parse_number({result, [digit | tail]}) when digit in ?0..?9 do
    _parse_number({result * 10 + digit - ?0, tail})
  end
  defp _parse_number({result, [digit | tail]}) when digit == ?\s do
    _parse_number({result, tail})
  end
  defp _parse_number(result), do: result

  defp _parse_operator([digit | tail]) when digit in '+-*/', do: {digit, tail}

  defp _calc(?+, num1, num2), do: num1 + num2
  defp _calc(?-, num1, num2), do: num1 - num2
  defp _calc(?*, num1, num2), do: num1 * num2
  defp _calc(?/, num1, num2), do: num1 / num2
end
