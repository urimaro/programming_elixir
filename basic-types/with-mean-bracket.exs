values = 1..10

mean = with(
         count = Enum.count(values), 
         sum   = Enum.sum(values)
       do
         sum/count
       end)

IO.puts mean

