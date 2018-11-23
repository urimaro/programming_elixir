# 練習問題 MacrosAndCodeEvaluation - 2

数値を一つ引数として取る、 `times_n` というマクロを定義しよう。
このマクロは、 `times_n` という名前の関数を、呼び出したモジュールの中に定義する。
定義された関数は一つの引数を取り、それに `n` を掛けた値を返す。
つまり、 `times_n(3)` は `times_3` という関数を定義し、 `times_3(4)` は `12` を返す。
これが使い方の例だ。

```
defmodule Test do
  require Times
  Times.times_n(3)
  Times.times_n(4)
end

IO.puts Test.times_3(4)  #=> 12
IO.puts Test.times_4(5)  #=> 20
```

- 関数の定義を内部表現で返す必要がある  
    quote関数を使う
- 関数名はアトム
- 関数名に引数を含める

```
goh@goh% iex "MacrosAndCodeEvaluation-2.exs"
Erlang/OTP 21 [erts-10.1.2] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

12
20
```

