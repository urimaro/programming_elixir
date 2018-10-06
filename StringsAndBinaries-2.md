```
> c "StringsAndBinaries-2.exs"
[StringsAndBinaries]
> StringsAndBinaries.anagram?('what', 'tahw')
true
> StringsAndBinaries.anagram?('what', 'taha')
false
> StringsAndBinaries.anagram?("what", "tahw")
** (RuntimeError) Arguments must be lists.
    StringsAndBinaries-2.exs:6: StringsAndBinaries.anagram?/2
```

