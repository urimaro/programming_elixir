IO.inspect [ a, a ] = [ 1, 1 ]
IO.inspect a
#=> 1
#IO.inspect [ a, a ] = [ 1, 2 ]
#=> MatchError

IO.puts "---"

IO.inspect a = 1
IO.inspect [ 1, a, 3 ] = [ 1, 2, 3 ]
IO.inspect a
#=> 2

IO.puts "---"

IO.inspect a = 1
IO.inspect a = 2
#IO.inspect ^a = 1
#=> MatchError

IO.puts "---"

IO.inspect a = 1
IO.inspect [ ^a, 2, 3 ] = [ 1, 2, 3 ]
#=> [ 1, 2, 3 ]
IO.inspect a = 2
#IO.inspect [ ^a, 2 ] = [ 1, 2 ]
#=> MatchError
