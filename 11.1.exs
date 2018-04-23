# ヒアドキュメント
IO.puts "start"
IO.write "
   my
   string
"
IO.puts "end"

IO.puts "---"

IO.puts "start"
IO.write """
   my
   string
   """
IO.puts "end"

IO.puts "---"

IO.puts "start"
IO.write " my
    string
   "
IO.puts "end"

IO.puts "---"

IO.puts "start"
IO.write """
 my
    string
   """
IO.puts "end"

IO.puts "---"

IO.puts "start"
IO.write """
  my
   string
 """
IO.puts "end"
