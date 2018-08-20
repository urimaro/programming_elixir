`exit(:boom)` しない場合
(L6 `exit(:boom)` をコメントアウト)

```
goh@goh% elixir -r WorkingWithMultipleProcesses-3.exs
Good bye!
Nothing happend as far as I am concerned
```

`exit(:boom)` する場合

```
goh@goh% elixir -r WorkingWithMultipleProcesses-3.exs
** (EXIT from #PID<0.89.0>) :boom
```

