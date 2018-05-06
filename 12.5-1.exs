defmodule MyCase do
  def open_file(user_file_name) do
    case File.open(user_file_name) do
      {:ok, file} ->
        process(file)
      {:error, message} ->
        IO.puts :stderr, "Couldn't open #{user_file_name}: #{message}"
    end
  end

  def process(file) do
    IO.puts IO.read(file, :line)
    File.close(file)
  end
end

