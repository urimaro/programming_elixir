```
goh@goh% iex -S mix
Erlang/OTP 21 [erts-10.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Compiling 1 file (.ex)
warning: function init/1 required by behaviour GenServer is not implemented (in module Stack.Server).

We will inject a default implementation for now:

    def init(args) do
      {:ok, args}
    end

You can copy the implementation above or define your own that converts the arguments given to GenServer.start_link/3 to the server state.

  lib/stack/server.ex:1

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
> Stack.Server.start_link([5, "cat", 9])
{:ok, #PID<0.140.0>}
> Stack.Server.pop
5
> Stack.Server.push("five")
:ok
> Stack.Server.pop
"five"
> Stack.Server.pop
"cat"
```

