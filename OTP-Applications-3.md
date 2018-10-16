# OTP-Applications - 3

- サーバーがクラッシュしても、差分が保持されるようにする
- 新しいリリースを作る

---

- アプリケーションのバージョンを上げる
- データ構造を変える
    - バージョンを設定する
    - 構造体を使う
- 処理を変える

リリース前の動作確認
terminateしても、`increment_number` は保持されている

```
goh@goh% iex -S mix
Erlang/OTP 21 [erts-10.1.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Compiling 1 file (.ex)
Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
> Sequence2.Server.next_number
"The next number is 456"
> Sequence2.Server.next_number
"The next number is 457"
> Sequence2.Server.increment_number 10
:ok
> Sequence2.Server.next_number
"The next number is 468"
> Sequence2.Server.next_number
"The next number is 478"
> Sequence2.Server.increment_number "a"
Server.terminate/2
:ok
> %Sequence2.Server.State{current_number: 488, delta: 10, stash_pid: #PID<0.200.0>}

00:55:50.523 [error] GenServer Sequence2.Server terminating
** (ArithmeticError) bad argument in arithmetic expression
    :erlang.+(488, "a")
    (sequence2) lib/sequence2/server.ex:50: Sequence2.Server.handle_cast/2
    (stdlib) gen_server.erl:637: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:711: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Last message: {:"$gen_cast", {:increment_number, "a"}}
State: [data: [{'State', "My current state is '%Sequence2.Server.State{current_number: 488, delta: 10, stash_pid: #PID<0.200.0>}', and I'm happy"}]]
> Sequence2.Server.next_number
"The next number is 488"
> Sequence2.Server.next_number
"The next number is 498"
```

