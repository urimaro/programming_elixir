`Enum.to_list` を呼び出した後に処理しているのが残念…
1行ごとにキーワードリストにして、送り込めるようにしたい

```
> c "StringsAndBinaries-7.exs"
[StringsAndBinaries]
> StringsAndBinaries.convert_csv_to_keyword_list "./sales_info.csv"
[
  [net_amount: "100.00", ship_to: ":NC", id: "123"],
  [net_amount: "35.50", ship_to: ":OK", id: "124"],
  [net_amount: "24.00", ship_to: ":TX", id: "125"],
  [net_amount: "44.80", ship_to: ":TX", id: "126"],
  [net_amount: "25.00", ship_to: ":NC", id: "127"],
  [net_amount: "10.00", ship_to: ":MA", id: "128"],
  [net_amount: "102.00", ship_to: ":CA", id: "129"],
  [net_amount: "50.00", ship_to: ":NC", id: "130"]
]
```

ヘッダとデータ部を分けて処理した
データをinteger、atom、floatに変換した

```
> c "StringsAndBinaries-7-2.exs"
[StringsAndBinaries]
> c "ListsAndRecursion-8_for_StringsAndBinaries-7.exs"
[Order]
> tax_rates = [NC: 0.075, TX: 0.08]
[NC: 0.075, TX: 0.08]
> "./sales_info.csv" |> StringsAndBinaries.csv_to_keyword |> Order.add_total_amount(tax_rates)
[
  [id: 123, ship_to: :NC, net_amount: 100.0, total_amount: 107.5],
  [id: 124, ship_to: :OK, net_amount: 35.5, total_amount: 35.5],
  [id: 125, ship_to: :TX, net_amount: 24.0, total_amount: 25.92],
  [id: 126, ship_to: :TX, net_amount: 44.8, total_amount: 48.384],
  [id: 127, ship_to: :NC, net_amount: 25.0, total_amount: 26.875],
  [id: 128, ship_to: :MA, net_amount: 10.0, total_amount: 10.0],
  [id: 129, ship_to: :CA, net_amount: 102.0, total_amount: 102.0],
  [id: 130, ship_to: :NC, net_amount: 50.0, total_amount: 53.75]
]
```

