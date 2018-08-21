# ^pid を \_pid に変更

`^pid` を `_pid` に変更した `spawn/pmap.exs` を実行しただけでは、順番は変わらない

```
> c "WorkingWithMultipleProcesses-7.exs"
warning: variable "pid" is unused
  WorkingWithMultipleProcesses-7.exs:8

[Parallel]
> Parallel.pmap 1..10, &(&1 * &1)
[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```

# 実行する関数の変更
以下のように変更

1. ランダムな時間(100〜1000[ms])待つ
2. x * x

- 改修前

    ```
    &(&1 * &1)
    ```

- 改修後

    ```
    fn x ->
      ms = Enum.random(1..10) * 100
      :timer.sleep(ms)
      x * x
    end
    ```

実行結果

- `_pid` の場合

```
> c "WorkingWithMultipleProcesses-7.exs"
warning: variable "pid" is unused
  WorkingWithMultipleProcesses-7.exs:8

[Parallel]
> Parallel.pmap 1..10, fn x ->
> ms = Enum.random(1..10) * 100
> :timer.sleep(ms)
> x * x
> end
[81, 100, 49, 25, 36, 16, 1, 4, 64, 9]
```

- `^pid` の場合

```
> Parallel.pmap 1..10, fn x ->
> ms = Enum.random(1..10) * 100
> :timer.sleep(ms)
> x * x
> end
[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```

