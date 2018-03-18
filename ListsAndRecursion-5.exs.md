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

