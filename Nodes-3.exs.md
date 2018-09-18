`nodes/ticker.ex` から変更が必要な箇所

1. クライアントのリストを使う  
    クライアントのリストに登録された順に処理する  
    オリジナルは `[pid | clients]` としているので、新しいクライアントは先頭に追加される  
    =>  
    `Enum.reverse/1` を使うのが常套手段らしい
2. 1回に送るメッセージは1クライント
    - 現状: 全てのクライアントにメッセージを送る
    - 改修後: 1クライアントにメッセージを送る
3. リストのどこまでメッセージを送ったのか記憶する必要がある
4. リストの範囲外になったらリストの先頭からはじめる

Server

```
goh@goh% iex --sname server Nodes-3.ex
Erlang/OTP 21 [erts-10.0.8] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(server@goh)1> Node.connect :one@goh
true
iex(server@goh)2> Node.connect :two@goh
true
iex(server@goh)3> Node.connect :three@goh
true
iex(server@goh)4> Ticker.start
:yes
tick
tick
registering #PID<13970.128.0>
tick
send to #PID<13970.128.0>
tick
send to #PID<13970.128.0>
registering #PID<14099.126.0>
tick
send to #PID<13970.128.0>
tick
send to #PID<14099.126.0>
tick
send to #PID<13970.128.0>
tick
send to #PID<14099.126.0>
registering #PID<14100.127.0>
tick
send to #PID<13970.128.0>
tick
send to #PID<14099.126.0>
tick
send to #PID<14100.127.0>
tick
send to #PID<13970.128.0>
tick
send to #PID<14099.126.0>
tick
send to #PID<14100.127.0>
iex(server@goh)5>
```

Client one

```
goh@goh% iex --sname one Nodes-3.ex
Erlang/OTP 21 [erts-10.0.8] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(one@goh)1> Client.start
{:register, #PID<0.128.0>}
tock in client
tock in client
tock in client
tock in client
tock in client
tock in client
iex(one@goh)2>
```

Client two

```
goh@goh% iex --sname two Nodes-3.ex
Erlang/OTP 21 [erts-10.0.8] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(two@goh)1> Client.start
{:register, #PID<0.126.0>}
tock in client
tock in client
tock in client
tock in client
iex(two@goh)2>
```

Client three

```
goh@goh% iex --sname three Nodes-3.ex
Erlang/OTP 21 [erts-10.0.8] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(three@goh)1> Client.start
{:register, #PID<0.127.0>}
tock in client
tock in client
iex(three@goh)2>
```

パターンマッチとガード節の組み合わせで実装すると、重複するコードが増えてしまうような？
重複する処理は1行でも関数を定義する？

