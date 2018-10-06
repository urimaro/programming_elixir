```
> prefix = fn prefix -> (fn name -> "#{prefix} #{name}" end) end
#Function<6.99386804/1 in :erl_eval.expr/5>
> mrs = prefix.("Mrs")
#Function<6.99386804/1 in :erl_eval.expr/5>
> mrs.("Smith")
"Mrs Smith"
> prefix.("Elixir").("Rocks")
"Elixir Rocks"
``` 

