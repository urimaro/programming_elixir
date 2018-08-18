```
goh@goh% elixir -r WorkingWithMultipleProcesses-2-1.exs -e "Token.run()"
The token is betty
The token is fred
goh@goh% elixir -r WorkingWithMultipleProcesses-2-2.exs -e "Token.run()"
The token is fred
The token is betty
```

Q1. プロセスから戻ってくる返事の順序は理論的に決定的であるか？実際は？
A1. 決定的でない。実装に依存する
　　`WorkingWithMultipleProcesses-2-1.exs` を実行すると順序どおりにならない

Q2. もしその答えが「No」であるなら、どうすれば順序を決定的にできるだろうか？
A2. 先の処理をreceiveしてから後の処理を呼び出せば良い
　　`WorkingWithMultipleProcesses-2-2.exs` を実行すると、呼び出し順どおりに処理される

```
goh@goh% git diff --no-index -- WorkingWithMultipleProcesses-2-1.exs WorkingWithMultipleProcesses-2-2.exs
diff --git a/WorkingWithMultipleProcesses-2-1.exs b/WorkingWithMultipleProcesses-2-2.exs
index 21a0463..15336cd 100644
--- a/WorkingWithMultipleProcesses-2-1.exs
+++ b/WorkingWithMultipleProcesses-2-2.exs
@@ -16,13 +16,13 @@ defmodule Token do
     pid_2nd = spawn(Token, :send_token, [])
 
     send pid_1st, {self(), "fred"}
-    send pid_2nd, {self(), "betty"}
 
     receive do
       {:ok, token} ->
         IO.puts "The token is #{token}"
     end
 
+    send pid_2nd, {self(), "betty"}
     receive do
       {:ok, token} ->
         IO.puts "The token is #{token}"
```

