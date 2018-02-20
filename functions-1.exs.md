```
> list_concat = fn ([a, b], [c, d]) -> [a, b, c, d] end
#Function<12.99386804/2 in :erl_eval.expr/5>
> list_concat.([:a, :b], [:c, :d])
[:a, :b, :c, :d]
> sum = fn a, b, c -> a + b + c end
#Function<18.99386804/3 in :erl_eval.expr/5>
> sum.(1, 2, 3)
6
> pair_tuple_to_list = fn {a, b} -> [a, b] end
#Function<6.99386804/1 in :erl_eval.expr/5>
> pair_tuple_to_list.({1234, 5678})
[1234, 5678]
```

