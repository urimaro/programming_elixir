a = Stream.resource(fn -> File.open!("10.2.sample") end,
                    fn file ->
                      case IO.read(file, :line) do
                        data when is_binary(data) -> {[data], file}
                        _ -> {:halt, file}
                      end
                    end,
                    fn file -> File.close(file) end)
IO.puts(a |> Enum.take(2))
