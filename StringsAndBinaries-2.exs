defmodule StringsAndBinaries do
  def anagram?(word1, word2) when is_list word1 and is_list word2 do
    Enum.reverse(word1) == word2
  end
  def anagram?(_, _) do
    raise "Arguments must be lists."
  end
end
