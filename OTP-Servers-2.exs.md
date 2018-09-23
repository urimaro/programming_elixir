```
> {:ok, pid} = GenServer.start_link(Stack.Server, [5, "cat", 9], [debug: [:trace, :statistics]])
{:ok, #PID<0.154.0>}
> GenServer.call(pid, :pop)
*DBG* <0.154.0> got call pop from <0.137.0>
*DBG* <0.154.0> sent 5 to <0.137.0>, new state [<<"cat">>,9]
5
> GenServer.cast(pid, {:push, "dog"})
*DBG* <0.154.0> got cast {push,<<"dog">>}
:ok
*DBG* <0.154.0> new state [<<"dog">>,<<"cat">>,9]
> GenServer.call(pid, :pop)
*DBG* <0.154.0> got call pop from <0.137.0>
*DBG* <0.154.0> sent <<"dog">> to <0.137.0>, new state [<<"cat">>,9]
"dog"
> GenServer.call(pid, :pop)
*DBG* <0.154.0> got call pop from <0.137.0>
*DBG* <0.154.0> sent <<"cat">> to <0.137.0>, new state "\t"
"cat"
```

最後、 `new state` が `"\t"` になっているのは `[9]` がTAB文字に対応しているため

