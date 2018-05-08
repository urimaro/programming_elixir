```
> c "ControlFlow-3.exs"
[ControlFlow]
> file = ControlFlow.ok! File.open("sales_info.csv")
#PID<0.127.0>
> file = ControlFlow.ok! File.open("sales_info.cs")
** (RuntimeError) atom: error, data: enoent
    ControlFlow-3.exs:3: ControlFlow.ok!/1
```

