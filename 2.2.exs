IO.inspect list = [ 1, 2, 3 ]
IO.inspect [ a, b, c ] = list
IO.inspect a
#=> 1
IO.inspect b
#=> 2
IO.inspect c
#=> 3

IO.inspect list = [ 1, 2, [ 3, 4, 5 ] ]
IO.inspect [ a, b, c ] = list
IO.inspect a
#=> 1
IO.inspect b
#=> 2
IO.inspect c
#=> [ 3, 4, 5 ]

IO.inspect list = [ 1, 2, 3 ]
IO.inspect [ a, 2, b ] = list
IO.inspect a
#=> 1
IO.inspect b
#=> 3

IO.inspect list = [ 1, 2, 3 ]
#IO.inspect [ a, 1, b ] = list
#=> MatchError
