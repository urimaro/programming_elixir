以下を確認して `GenServer.terminate/2` が呼び出される条件に合わせて実装した
https://hexdocs.pm/elixir/master/GenServer.html#c:terminate/2

`OTP-Servers - 5` をリファクタリングした

0. Regression tests

```
> Stack.Server.start_link([5, "cat", 9])
{:ok, #PID<0.141.0>}
> Stack.Server.pop
5
> Stack.Server.push "dog"
:ok
> Stack.Server.pop
"dog"
> Stack.Server.pop
"cat"
> Stack.Server.push "cat"
:ok
> Stack.Server.push 5
:ok
```

1. Returns a `:stop` tuple

```
> Stack.Server.stop
Here is the terminate callback!
:ok
Reason: "That's the stop reason!"
State: [5, "cat", 9]
>
14:53:28.592 [error] GenServer Stack.Server terminating
** (stop) "That's the stop reason!"
Last message: {:"$gen_cast", :stop}
State: [5, "cat", 9]
** (EXIT from #PID<0.138.0>) shell process exited with reason: "That's the stop reason!"

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
```

2. Returns an invalid value

```
> Stack.Server.start_link([5, "cat", 9])
{:ok, #PID<0.152.0>}
> Stack.Server.invalid_value
Here is the terminate callback!
:ok
Reason: {:bad_return_value, {}}
State: [5, "cat", 9]
>
14:53:50.246 [error] GenServer Stack.Server terminating
** (stop) bad return value: {}
Last message: {:"$gen_cast", :invalid_value}
State: [5, "cat", 9]
** (EXIT from #PID<0.150.0>) shell process exited with reason: bad return value: {}

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
```

3. Calls `System.halt/1`
3-1. `System.halt(0)`

```
> Stack.Server.start_link([5, "cat", 9])
{:ok, #PID<0.157.0>}
> Stack.Server.halt_0
> %
goh@goh%
```

3-2. `System.halt(1)`

```
goh@goh% iex -S mix
Erlang/OTP 21 [erts-10.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
> Stack.Server.start_link([5, "cat", 9])
{:ok, #PID<0.131.0>}
> Stack.Server.halt_1
goh@goh%
```

3-3. `System.halt(:abort)`

```
goh@goh% iex -S mix
Erlang/OTP 21 [erts-10.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
> Stack.Server.start_link([5, "cat", 9])
{:ok, #PID<0.131.0>}
> Stack.Server.halt_abort
zsh: abort      iex -S mix
goh@goh%
```

4. Calls `Kernel.exit/1`
4-1. `Kernel.exit(:normal)`

```
goh@goh% iex -S mix
Erlang/OTP 21 [erts-10.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
> Stack.Server.start_link([5, "cat", 9])
{:ok, #PID<0.131.0>}
> Stack.Server.kernel_exit_normal
Here is the terminate callback!
:ok
Reason: :normal
State: [5, "cat", 9]
>
```

4-2. `Kernel.exit(:shutdown)`

```
> Stack.Server.start_link([5, "cat", 9])
{:ok, #PID<0.134.0>}
> Stack.Server.kernel_exit_shutdown
Here is the terminate callback!
:ok
Reason: :shutdown
State: [5, "cat", 9]
** (EXIT from #PID<0.129.0>) shell process exited with reason: shutdown

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
>
```

4-3. `Kernel.exit/1` with a message

```
> Stack.Server.start_link([5, "cat", 9])
{:ok, #PID<0.139.0>}
> Stack.Server.kernel_exit_other
Here is the terminate callback!
:ok
Reason: "I wanna exit Kernel!"
State: [5, "cat", 9]
>
14:56:33.940 [error] GenServer Stack.Server terminating
** (stop) "I wanna exit Kernel!"
    (stack) lib/stack/server.ex:68: Stack.Server.handle_cast/2
    (stdlib) gen_server.erl:637: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:711: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Last message: {:"$gen_cast", {:kernel_exit, "I wanna exit Kernel!"}}
State: [5, "cat", 9]
** (EXIT from #PID<0.137.0>) shell process exited with reason: "I wanna exit Kernel!"

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
>
```

5. Raises an exception

```
> Stack.Server.start_link([5, "cat", 9])
{:ok, #PID<0.144.0>}
> Stack.Server.raise
:ok
Here is the terminate callback!
Reason: {%RuntimeError{message: "I've raised!"}, [{Stack.Server, :handle_cast, 2, [file: 'lib/stack/server.ex', line: 70]}, {:gen_server, :try_dispatch, 4, [file: 'gen_server.erl', line: 637]}, {:gen_server, :handle_msg, 6, [file: 'gen_server.erl', line: 711]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 249]}]}
State: [5, "cat", 9]
>
14:56:52.914 [error] GenServer Stack.Server terminating
** (RuntimeError) I've raised!
    (stack) lib/stack/server.ex:70: Stack.Server.handle_cast/2
    (stdlib) gen_server.erl:637: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:711: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Last message: {:"$gen_cast", {:raise, "I've raised!"}}
State: [5, "cat", 9]
** (EXIT from #PID<0.142.0>) shell process exited with reason: an exception was raised:
    ** (RuntimeError) I've raised!
        (stack) lib/stack/server.ex:70: Stack.Server.handle_cast/2
        (stdlib) gen_server.erl:637: :gen_server.try_dispatch/4
        (stdlib) gen_server.erl:711: :gen_server.handle_msg/6
        (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
>
```

