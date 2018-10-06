`GenServer.start_link/3` 実行時に、プロセス名として `:stack` を指定

```
goh@goh% iex -S mix
Erlang/OTP 21 [erts-10.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
> GenServer.start_link(Stack.Server, [5, "cat", 9], name: :stack)
{:ok, #PID<0.131.0>}
> GenServer.call(:stack, :pop)
5
> GenServer.cast(:stack, {:push, "five"})
:ok
> GenServer.call(:stack, :pop)
"five"
> GenServer.call(:stack, :pop)
"cat"
```

