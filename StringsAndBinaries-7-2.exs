defmodule StringsAndBinaries do
  def csv_to_keyword(path) do
    {:ok, file} = File.open(path)
    header = file
             |> IO.read(:line)
             |> _parse_header
    file
    |> IO.stream(:line)
    |> Stream.map(&(_parse_record(&1)))
    |> Stream.map(&(Enum.zip(header, &1)))
    |> Enum.to_list
  end

  defp _parse_header(line) do
    line
    |> String.trim_trailing
    |> String.split(",")
    |> Enum.map(&(String.to_atom(&1)))
  end

  defp _parse_record(line) do
    [id, ship_to, net_amount] = line
                                |> String.trim_trailing
                                |> String.split(",")
    [
      String.to_integer(id),
      String.to_atom(String.trim_leading(ship_to, ":")),
      String.to_float(net_amount)
    ]
  end
end

