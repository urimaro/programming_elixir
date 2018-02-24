defmodule ModulesAndFunctions do
  def list_length([]),         do: 0
  def list_length([_ | tail]), do: 1 + list_length(tail)
end

