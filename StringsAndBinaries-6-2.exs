defmodule StringsAndBinaries do
  def capitalize_sentences(sentences) when is_binary(sentences) do
    ~r{\. }
    |> Regex.split(sentences, include_captures: true)
    |> Enum.reduce("", &(&2 <> String.capitalize(&1)))
  end
end

