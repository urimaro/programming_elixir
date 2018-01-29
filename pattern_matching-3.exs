# P17 PatternMatching-3
IO.inspect a = 2

#[ a, b, a ] = [ 1, 2, 3 ]
#=> MatchError
#[ a, b, a ] = [ 1, 1, 2 ]
#=> MatchError
IO.inspect a = 1

a = 2
IO.inspect ^a = 2
#^a = 1
#=> MatchError
#^a = 2 - a
#=> MatchError
