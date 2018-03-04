```
> c "ListsAndRecursion-2.exs"
warning: redefining module MyList (current version defined in memory)
  ListsAndRecursion-2.exs:1

[MyList]
> MyList.max []
Nothing coz there is no element.
:ok
> MyList.max [1]
1
> MyList.max [1, 2, 3]
3
> MyList.max [-1, -2, -3]
-1
> MyList.max [4, 6, 5]
6
```

