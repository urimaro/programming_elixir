IO.inspect [ 1, _, _ ] = [ 1, 2, 3 ]
#=> [ 1, 2, 3 ]
IO.inspect [ 1, _, _ ] = [ 1, "cat", "dog" ]
#=> [ 1, "cat", "dog" ]
