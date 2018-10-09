```
goh@goh% iex -S mix
Erlang/OTP 21 [erts-10.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Compiling 1 file (.ex)
Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
> Stack.Server.pop
5
> Stack.Server.pop
"cat"
> Stack.Server.push "dog"
:ok
> Stack.Server.pop
"dog"
> Stack.Server.pop
9
```

