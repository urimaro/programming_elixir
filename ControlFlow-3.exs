defmodule ControlFlow do
  def ok!({:ok, data}), do: data
  def ok!({atom, data}), do: raise "atom: #{atom}, data: #{data}"
end

