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

Enum.split/2

```
> Enum.split([1, 2, 3], 10)
{[1, 2, 3], []}
> Enum.split([1, 2, 3], 2)
{[1, 2], [3]}
> Enum.split([1, 2, 3], 0)
{[], [1, 2, 3]}
> Enum.split([1, 2, 3], -1)
{[1, 2], [3]}
> Enum.split([1, 2, 3], -5)
{[], [1, 2, 3]}
```

ListsAndRecursion.split/2

```
> ListsAndRecursion.split([1, 2, 3], 10)
{[3, 2, 1], []}
> ListsAndRecursion.split([1, 2, 3], 3)
{[1, 2, 3], []}
> ListsAndRecursion.split([1, 2, 3], 2)
{[1, 2], [3]}
> ListsAndRecursion.split([1, 2, 3], 1)
{[1], [2, 3]}
> ListsAndRecursion.split([1, 2, 3], 0)
{[], [1, 2, 3]}
> ListsAndRecursion.split([1, 2, 3], -1)
{[1, 2], [3]}
> ListsAndRecursion.split([1, 2, 3], -2)
{[1], [2, 3]}
> ListsAndRecursion.split([1, 2, 3], -3)
{[], [1, 2, 3]}
> ListsAndRecursion.split([1, 2, 3], -5)
{[], [1, 2, 3]}
```

Enum.take/2

```
> Enum.take([1, 2, 3], 0)
[]
> Enum.take([1, 2, 3], 1)
[1]
> Enum.take([1, 2, 3], 2)
[1, 2]
> Enum.take([1, 2, 3], 3)
[1, 2, 3]
> Enum.take([1, 2, 3], 4)
[1, 2, 3]
> Enum.take([1, 2, 3], -1)
[3]
> Enum.take([1, 2, 3], -2)
[2, 3]
> Enum.take([1, 2, 3], -3)
[1, 2, 3]
> Enum.take([1, 2, 3], -4)
[1, 2, 3]
> 
```

ListsAndRecursion.take/2

```
> ListsAndRecursion.take([1, 2, 3], 0)
[]
> ListsAndRecursion.take([1, 2, 3], 1)
[1]
> ListsAndRecursion.take([1, 2, 3], 2)
[1, 2]
> ListsAndRecursion.take([1, 2, 3], 3)
[1, 2, 3]
> ListsAndRecursion.take([1, 2, 3], 4)
[1, 2, 3]
> ListsAndRecursion.take([1, 2, 3], -1)
[3]
> ListsAndRecursion.take([1, 2, 3], -2)
[2, 3]
> ListsAndRecursion.take([1, 2, 3], -3)
[1, 2, 3]
> ListsAndRecursion.take([1, 2, 3], -4)
[1, 2, 3]
```

