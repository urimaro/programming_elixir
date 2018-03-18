Enum.all?/2

```
> Enum.all?([1, 2, 3, 4, 5], &(&1 < 4))
false
> Enum.all?([1, 2, 3, 4], &(&1 < 4))
false
> Enum.all?([1, 2, 4, 3], &(&1 < 4))
false
> Enum.all?([1, 2, 3], &(&1 < 4))
true
> Enum.all?([], &(&1 < 4))
true
```

ListsAndRecursion.all/?

```
> ListsAndRecursion.all?([1, 2, 3, 4, 5], &(&1 < 4))
false
> ListsAndRecursion.all?([1, 2, 3, 4], &(&1 < 4))
false
> ListsAndRecursion.all?([1, 2, 4, 3], &(&1 < 4))
false
> ListsAndRecursion.all?([1, 2, 3], &(&1 < 4))
true
> ListsAndRecursion.all?([], &(&1 < 4))
true
```

Enum.each/2

```
> Enum.each([1, 2, 3], &(IO.puts &1))
1
2
3
:ok
> Enum.each([], &(IO.puts &1))
:ok
```

ListsAndRecursion.each/2

```
> ListsAndRecursion.each([1, 2, 3], &(IO.puts &1))
1
2
3
:ok
> ListsAndRecursion.each([], &(IO.puts &1))
:ok
```

Enum.filter/2

```
> Enum.filter([1, 2, 3], &(rem(&1, 2) == 0))
[2]
> Enum.filter([1, 2, 3, 4, 5, 6], &(rem(&1, 2) == 0))
[2, 4, 6]
> Enum.filter([], &(rem(&1, 2) == 0))
[]
```

ListsAndRecursion.filter/2

```
> ListsAndRecursion.filter([1, 2, 3], &(rem(&1, 2) == 0))
[2]
> ListsAndRecursion.filter([1, 2, 3, 4, 5, 6], &(rem(&1, 2) == 0))
[2, 4, 6]
> ListsAndRecursion.filter([], &(rem(&1, 2) == 0))
[]
```

