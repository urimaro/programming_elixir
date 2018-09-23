空のスタックからpopさせようとした場合は、クラッシュしても良いことにしている

```
goh@goh% iex -S mix
Erlang/OTP 21 [erts-10.0.8] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Compiling 2 files (.ex)
warning: function init/1 required by behaviour GenServer is not implemented (in module Stack.Server).

We will inject a default implementation for now:

    def init(args) do
      {:ok, args}
    end

You can copy the implementation above or define your own that converts the arguments given to GenServer.start_link/3 to the server state.

  lib/stack/server.ex:1

Generated stack app
Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
> {:ok, pid} = GenServer.start_link(Stack.Server, [5, "cat", 9])
{:ok, #PID<0.162.0>}
> GenServer.call(pid, :pop)
5
> GenServer.call(pid, :pop)
"cat"
> GenServer.call(pid, :pop)
9
> GenServer.call(pid, :pop)

13:10:01.955 [error] GenServer #PID<0.162.0> terminating
** (FunctionClauseError) no function clause matching in Stack.Server.handle_call/3
    (stack) lib/stack/server.ex:4: Stack.Server.handle_call(:pop, {#PID<0.160.0>, #Reference<0.2368182435.583270401.430>}, [])
    (stdlib) gen_server.erl:661: :gen_server.try_handle_call/4
    (stdlib) gen_server.erl:690: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Last message (from #PID<0.160.0>): :pop
State: []
Client #PID<0.160.0> is alive

    (stdlib) gen.erl:169: :gen.do_call/4
    (elixir) lib/gen_server.ex:921: GenServer.call/3
    (stdlib) erl_eval.erl:677: :erl_eval.do_apply/6
    (elixir) src/elixir.erl:265: :elixir.eval_forms/4
    (iex) lib/iex/evaluator.ex:249: IEx.Evaluator.handle_eval/5
    (iex) lib/iex/evaluator.ex:229: IEx.Evaluator.do_eval/3
    (iex) lib/iex/evaluator.ex:207: IEx.Evaluator.eval/3
    (iex) lib/iex/evaluator.ex:94: IEx.Evaluator.loop/1
** (EXIT from #PID<0.160.0>) shell process exited with reason: an exception was raised:
    ** (FunctionClauseError) no function clause matching in Stack.Server.handle_call/3
        (stack) lib/stack/server.ex:4: Stack.Server.handle_call(:pop, {#PID<0.160.0>, #Reference<0.2368182435.583270401.430>}, [])
        (stdlib) gen_server.erl:661: :gen_server.try_handle_call/4
        (stdlib) gen_server.erl:690: :gen_server.handle_msg/6
        (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
```

