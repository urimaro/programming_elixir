```
goh@goh% iex -S mix
Erlang/OTP 21 [erts-10.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
> Stack.Server.pop
5
> Stack.Server.pop
"cat"
> Stack.Server.pop
9
> Stack.Server.pop
Here is the terminate callback!
Reason: {:function_clause, [{Stack.Server, :handle_call, [:pop, {#PID<0.133.0>, #Reference<0.2075795563.2114977794.15797>}, []], [file: 'lib/stack/server.ex', line: 16]}, {:gen_server, :try_handle_call, 4, [file: 'gen_server.erl', line: 661]}, {:gen_server, :handle_msg, 6, [file: 'gen_server.erl', line: 690]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 249]}]}
State: []

19:37:18.260 [error] GenServer Stack.Server terminating
** (FunctionClauseError) no function clause matching in Stack.Server.handle_call/3
    (stack) lib/stack/server.ex:16: Stack.Server.handle_call(:pop, {#PID<0.133.0>, #Reference<0.2075795563.2114977794.15797>}, [])
    (stdlib) gen_server.erl:661: :gen_server.try_handle_call/4
    (stdlib) gen_server.erl:690: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Last message (from #PID<0.133.0>): :pop
State: []
Client #PID<0.133.0> is alive

    (stdlib) gen.erl:169: :gen.do_call/4
    (elixir) lib/gen_server.ex:921: GenServer.call/3
    (stdlib) erl_eval.erl:680: :erl_eval.do_apply/6
    (elixir) src/elixir.erl:265: :elixir.eval_forms/4
    (iex) lib/iex/evaluator.ex:249: IEx.Evaluator.handle_eval/5
    (iex) lib/iex/evaluator.ex:229: IEx.Evaluator.do_eval/3
    (iex) lib/iex/evaluator.ex:207: IEx.Evaluator.eval/3
    (iex) lib/iex/evaluator.ex:94: IEx.Evaluator.loop/1
** (exit) exited in: GenServer.call(Stack.Server, :pop, 5000)
    ** (EXIT) an exception was raised:
        ** (FunctionClauseError) no function clause matching in Stack.Server.handle_call/3
            (stack) lib/stack/server.ex:16: Stack.Server.handle_call(:pop, {#PID<0.133.0>, #Reference<0.2075795563.2114977794.15797>}, [])
            (stdlib) gen_server.erl:661: :gen_server.try_handle_call/4
            (stdlib) gen_server.erl:690: :gen_server.handle_msg/6
            (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
    (elixir) lib/gen_server.ex:924: GenServer.call/3
> Stack.Server.pop
5
> Stack.Server.pop
"cat"
> Stack.Server.pop
9
> Stack.Server.push 9
:ok
> Stack.Server.pop
9
```

