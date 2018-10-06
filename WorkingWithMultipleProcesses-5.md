# `exit(:boom)` しない場合

`Good bye!` も子プロセスが終了したことも受信している
子プロセス終了時に受信したtupleの最後の項目に終了コード `:normal` が設定されている

```
goh@goh% elixir -r WorkingWithMultipleProcesses-5-1.exs
Good bye!
Message received: {:DOWN, #Reference<0.1352651912.1559232513.257234>, :process, #PID<0.94.0>, :normal}
Nothing happend as far as I am concerned
```

# `exit(:boom)` する場合
`Good bye!` も子プロセスが終了したことも受信している
子プロセス終了時に受信したtupleの最後の項目に終了コード `:boom` が設定されている

```
goh@goh% elixir -r WorkingWithMultipleProcesses-5-2.exs
Good bye!
Message received: {:DOWN, #Reference<0.4208419522.2633236482.237731>, :process, #PID<0.94.0>, :boom}
Nothing happend as far as I am concerned
```

# `raise RuntimeError` する場合

以下の順に受信している

1. 例外
2. `Good bye!`
3. 子プロセス終了  
    例外が発生していることがわかる

```
goh@goh% elixir -r WorkingWithMultipleProcesses-5-3.exs

10:39:46.542 [error] Process #PID<0.94.0> raised an exception
** (RuntimeError) Raise an exception
    WorkingWithMultipleProcesses-5-3.exs:6: MonitorWithExit.sad_function/0
Good bye!
Message received: {:DOWN, #Reference<0.3043561247.487587841.58935>, :process, #PID<0.94.0>, {%RuntimeError{message: "Raise an exception"}, [{MonitorWithExit, :sad_function, 0, [file: 'WorkingWithMultipleProcesses-5-3.exs', line: 6]}]}}
Nothing happend as far as I am concerned
```

