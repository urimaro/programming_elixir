content = "Now is the time"

lp = with {:ok, file}   = File.open("/etc/passwd"),
          content       = IO.read(file, :all),
          :ok           = File.close(file),
          # MatchError
          [_, uid, gid] = Regex.run(~r{xxx:.*?:(\d+):(\d+)}, content)
     do
       "Group: #{gid}, User: #{uid}"
     end

IO.puts lp
IO.puts content

