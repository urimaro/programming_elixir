# 練習問題 MacrosAndCodeEvaluation - 1

標準の `unless` 機能を持つ `myunless` という名前のマクロを書こう。その中で `if` 式を使っても良い。

## ifを使わない場合

```
goh@goh% iex "MacrosAndCodeEvaluation-1.exs"
Erlang/OTP 21 [erts-10.1.2] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

The condition is '1 == 2'
Here is do of unless
1 != 2
The condition is '1 != 2'
Here is else of unless
1 != 2
```

## ifを使った場合

```
goh@goh% iex "MacrosAndCodeEvaluation-1-2.exs"
Erlang/OTP 21 [erts-10.1.2] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

The condition is '1 == 2'
Here is do of unless
1 != 2
The condition is '1 != 2'
Here is else of unless
1 != 2
```

