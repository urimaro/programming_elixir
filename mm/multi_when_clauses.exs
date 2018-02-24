defmodule MultiWhenClauses do
  def is_zero(n) 
      when n > 0
      when n < 0 do
    IO.puts "#{n} is not zero"
  end
  def is_zero(_), do: IO.puts "This is zero"
end

