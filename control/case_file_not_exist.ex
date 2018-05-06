case File.open("./control/file_not_exist.ex") do
  {:ok, file} ->
    IO.puts "First line: #{IO.read(file, :line)}"
  {:error, reason} ->
    IO.puts "Failed to open file: #{reason}"
end

