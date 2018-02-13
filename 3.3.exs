list1 = [3, 2, 1]
IO.inspect list1
#=> [1, 2, 3]
IO.puts list2 = [4 | list1]
IO.inspect list2
#=> [4, 1, 2, 3]
