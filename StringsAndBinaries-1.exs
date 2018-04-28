defmodule StringsAndBinaries do
  def is_asciis?([]), do: false
  def is_asciis?(chars) when is_list chars do
    Enum.reduce(chars, true, &((&1 in ?\s..?~) && &2))
  end
  def is_asciis?(_) do
    raise "It's not a list."
  end
end
