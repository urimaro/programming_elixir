defmodule MyCase do
  def open_file do
    {:ok, file} = File.open("12.5-3.exs")
    process(file)
  end

  def open_file_not_exist do
    {:ok, file} = File.open("config_file")
    process(file)
  end

  def process(file) do
    IO.puts IO.read(file, :line)
    File.close(file)
  end
end

