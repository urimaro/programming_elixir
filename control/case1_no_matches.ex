defmodule Users do
  dave = %{name: "Dave", country: "US", likes: "programming"}

  case dave do
    %{state: some_state} = person ->
      IO.puts "#{person.name} lives in #{some_state}"
    _ ->
      IO.puts "No matches"
  end
end

