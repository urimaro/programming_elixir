defmodule StringsAndBinaries do
  def convert_csv_to_keyword_list(file_path) do
    {keys, records} = file_path
                      |> File.open!
                      |> IO.stream(:line)
                      |> Stream.map(&(
                          &1
                          |> String.trim_trailing
                          |> String.split(",")
                        ))
                      |> Enum.to_list
                      |> List.pop_at(0)
    Enum.map(records, &(_create_keyword_list([], keys, &1)))
  end

  defp _create_keyword_list(list, [key | key_tail], [value | value_tail]) do
    list
    |> Keyword.put(String.to_atom(key), value)
    |> _create_keyword_list(key_tail, value_tail)
  end
  defp _create_keyword_list(list, [], []), do: list
end

