defmodule StringsAndBinaries do
  def capitalize_sentences(sentences) when is_binary(sentences) do
    _upcase(sentences)
  end

  defp _upcase(<<head::utf8, tail::binary>>) do
    String.upcase(<<head>>) <> _downcase(tail)
  end
  defp _upcase(<<>>), do: <<>>

  defp _downcase(<<head::utf8, tail::binary>>) when head == ?. do
    <<head>> <> _downcase(tail)
  end
  defp _downcase(<<head::utf8, tail::binary>>) when head == ?\s do
    <<head>> <> _upcase(tail)
  end
  defp _downcase(<<head::utf8, tail::binary>>) do
    String.downcase(<<head>>) <> _downcase(tail)
  end
  defp _downcase(<<>>), do: <<>>
end

