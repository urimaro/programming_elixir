```
> Enum.map [1, 2, 3, 4], fn x -> x + 2 end
[3, 4, 5, 6]
> Enum.map [1, 2, 3, 4], &(&1 + 2)
[3, 4, 5, 6]
> Enum.map [1, 2, 3, 4], fn x -> IO.inspect x end
1
2
3
4
[1, 2, 3, 4]
> Enum.map [1, 2, 3, 4], &IO.inspect/1
1
2
3
4
[1, 2, 3, 4]
```

