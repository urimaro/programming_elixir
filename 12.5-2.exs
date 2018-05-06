defmodule MyCase do
  def open_file do
    case File.open("config_file") do
      {:ok, file} ->
        process(file)
      {:error, message} ->
        raise "Failed to open config file: #{message}"
    end
  end

  def process(file) do
    IO.puts IO.read(file, :line)
    File.close(file)
  end
end

