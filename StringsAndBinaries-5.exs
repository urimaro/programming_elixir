defmodule StringsAndBinaries do
  def center(string_list) when is_list string_list do
    max_length =
      string_list
      |> Enum.max_by(&(String.length(&1)))
      |> String.length
    Enum.each(string_list, fn string ->
      count = count_padding(string, max_length)
      string
      |> String.pad_leading(count)
      |> IO.puts
    end)
  end

  defp count_padding(string, max_length) do
    length = String.length(string)
    Integer.floor_div(length + max_length, 2)
  end

  # Enum.max_by/3を使わずにmax_lengthを求める
  def max_length([head | tail], acc) do
    length = String.length(head)
    if length >= acc do
      max_length(tail, length)
    else
      max_length(tail, acc)
    end
  end
  def max_length([], acc), do: acc
end
