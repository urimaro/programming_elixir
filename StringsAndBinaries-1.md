```
> c "StringsAndBinaries-1.exs"
[StringsAndBinaries]
> StringsAndBinaries.is_asciis?('abc')
true
> StringsAndBinaries.is_asciis?('123')
true
> StringsAndBinaries.is_asciis?('\t')
false
> StringsAndBinaries.is_asciis?('\b')
false
> StringsAndBinaries.is_asciis?('あ')
false
> StringsAndBinaries.is_asciis?('=-`+_)(*&^%$#@!~\][|}{\';":/.,?><')
true
> StringsAndBinaries.is_asciis?("abc")
** (RuntimeError) It's not a list.
    StringsAndBinaries-1.exs:9: StringsAndBinaries.is_asciis?/1
```

