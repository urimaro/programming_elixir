defmodule MyString do
  def each(str, func), do: _each(String.next_codepoint(str), func)

  defp _each({codepoint, rest}, func) do
    func.(codepoint)
    _each(String.next_codepoint(rest), func)
  end

  defp _each(nil, _), do: []
end

defmodule MyString2 do
  def each(str, func), do: _each(String.next_grapheme(str), func)

  defp _each({grapheme, rest}, func) do
    func.(grapheme)
    _each(String.next_grapheme(rest), func)
  end

  defp _each(nil, _), do: []
end
