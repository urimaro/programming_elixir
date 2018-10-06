Jose Valimと同じ考え方していたけれど、再帰の考え方が未熟で実装完了まで至らなかった。
スムーズにイメージできるようになる必要がある。
https://forums.pragprog.com/forums/322/topics/11936

```
> c "ListsAndRecursion-6.exs"
warning: redefining module MyList (current version defined in memory)
  ListsAndRecursion-6.exs:1

[MyList]
> MyList.flatten([1, 2, 3])
[1, 2, 3]
> MyList.flatten([])
[]
> MyList.flatten([1, [2, [3]]])
[1, 2, 3]
> MyList.flatten([[1], [2, 3]])
[1, 2, 3]
> MyList.flatten([[[1], 2], 3])
[1, 2, 3]
> MyList.flatten([[1], 2, [[3]]])
[1, 2, 3]
```

