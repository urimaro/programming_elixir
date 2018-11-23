defmodule My do
  defmacro myunless(condition, clauses) do
    do_clause   = Keyword.get(clauses, :do, nil)
    else_clause = Keyword.get(clauses, :else, nil)
    quote do
      case unquote(condition) do
          val when val in [false, nil] -> unquote(do_clause)
          _                            -> unquote(else_clause)
      end
    end
  end
end

defmodule Test do
  require My

  IO.puts "The condition is '1 == 2'"
  My.myunless 1 == 2 do
    IO.puts "Here is do of unless"
    IO.puts "1 != 2"
  else
    IO.puts "Here is else of unless"
    IO.puts "1 == 2"
  end

  IO.puts "The condition is '1 != 2'"
  My.myunless 1 != 2 do
    IO.puts "Here is do of unless"
    IO.puts "1 == 2"
  else
    IO.puts "Here is else of unless"
    IO.puts "1 != 2"
  end
end

