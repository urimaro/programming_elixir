以下を確認して `GenServer.terminate/2` が呼び出される条件に合わせて実装した
https://hexdocs.pm/elixir/master/GenServer.html#c:terminate/2

1. Returns a `:stop` tuple

```
> {:ok, pid} = GenServer.start_link(Stack.Server, [])
{:ok, #PID<0.140.0>}
> GenServer.cast(pid, :stop)
Here is the terminate function!
:ok
Reason: "That's the stop reason!"
State: []
>
13:00:10.924 [error] GenServer #PID<0.140.0> terminating
** (stop) "That's the stop reason!"
Last message: {:"$gen_cast", :stop}
State: []
** (EXIT from #PID<0.138.0>) shell process exited with reason: "That's the stop reason!"

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
```

2. Returns an invalid value

```
> {:ok, pid} = GenServer.start_link(Stack.Server, [])
{:ok, #PID<0.146.0>}
> GenServer.cast(pid, :invalid_value)
Here is the terminate function!
:ok
Reason: {:bad_return_value, {}}
State: []
>
13:01:08.322 [error] GenServer #PID<0.146.0> terminating
** (stop) bad return value: {}
Last message: {:"$gen_cast", :invalid_value}
State: []
** (EXIT from #PID<0.143.0>) shell process exited with reason: bad return value: {}

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
```

3. Calls `System.halt/1`
3-1. `System.halt(0)`

```
> {:ok, pid} = GenServer.start_link(Stack.Server, [])
{:ok, #PID<0.152.0>}
> GenServer.cast(pid, {:halt, 0})
> %
goh@goh%
```

3-2. `System.halt(1)`

```
goh@goh% iex -S mix
Erlang/OTP 21 [erts-10.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
> {:ok, pid} = GenServer.start_link(Stack.Server, [])
{:ok, #PID<0.131.0>}
> GenServer.cast(pid, {:halt, 1})
goh@goh%
```

3-3. `System.halt(:abort)`

```
goh@goh% iex -S mix
Erlang/OTP 21 [erts-10.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
>  {:ok, pid} = GenServer.start_link(Stack.Server, [])
{:ok, #PID<0.131.0>}
> GenServer.cast(pid, {:halt, :abort})
zsh: abort      iex -S mix
goh@goh%
```

4. Calls `Kernel.exit/1`
4-1. `Kernel.exit(:normal)`

```
goh@goh% iex -S mix
Erlang/OTP 21 [erts-10.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
> {:ok, pid} = GenServer.start_link(Stack.Server, [])
{:ok, #PID<0.131.0>}
> GenServer.cast(pid, {:kernel_exit, :normal})
Here is the terminate function!
:ok
Reason: :normal
State: []
>
```

4-2. `Kernel.exit(:shutdown)`

```
> {:ok, pid} = GenServer.start_link(Stack.Server, [])
{:ok, #PID<0.135.0>}
> GenServer.cast(pid, {:kernel_exit, :shutdown})
Here is the terminate function!
:ok
Reason: :shutdown
State: []
** (EXIT from #PID<0.129.0>) shell process exited with reason: shutdown

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
>
```

4-3. `Kernel.exit/1` with a message

```
> {:ok, pid} = GenServer.start_link(Stack.Server, [])
{:ok, #PID<0.141.0>}
> GenServer.cast(pid, {:kernel_exit, "I wanna exit Kernel!"})
Here is the terminate function!
:ok
Reason: "I wanna exit Kernel!"
State: []
>
13:06:54.779 [error] GenServer #PID<0.141.0> terminating
** (stop) "I wanna exit Kernel!"
    (stack) lib/stack/server.ex:56: Stack.Server.handle_cast/2
    (stdlib) gen_server.erl:637: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:711: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Last message: {:"$gen_cast", {:kernel_exit, "I wanna exit Kernel!"}}
State: []
** (EXIT from #PID<0.138.0>) shell process exited with reason: "I wanna exit Kernel!"

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
>
```

5. Raises an exception

```
> {:ok, pid} = GenServer.start_link(Stack.Server, [])
{:ok, #PID<0.147.0>}
> GenServer.cast(pid, {:raise, "I've raised!"})
:ok
Here is the terminate function!
Reason: {%RuntimeError{message: "I've raised!"}, [{Stack.Server, :handle_cast, 2, [file: 'lib/stack/server.ex', line: 60]}, {:gen_server, :try_dispatch, 4, [file: 'gen_server.erl', line: 637]}, {:gen_server, :handle_msg, 6, [file: 'gen_server.erl', line: 711]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 249]}]}
State: []
>
13:08:00.738 [error] GenServer #PID<0.147.0> terminating
** (RuntimeError) I've raised!
    (stack) lib/stack/server.ex:60: Stack.Server.handle_cast/2
    (stdlib) gen_server.erl:637: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:711: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Last message: {:"$gen_cast", {:raise, "I've raised!"}}
State: []
** (EXIT from #PID<0.144.0>) shell process exited with reason: an exception was raised:
    ** (RuntimeError) I've raised!
        (stack) lib/stack/server.ex:60: Stack.Server.handle_cast/2
        (stdlib) gen_server.erl:637: :gen_server.try_dispatch/4
        (stdlib) gen_server.erl:711: :gen_server.handle_msg/6
        (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
>
```

