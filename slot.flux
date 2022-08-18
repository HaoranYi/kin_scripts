from(bucket: "mainnet-beta")
  |> range(start: -5m)
  |> filter(fn: (r) => r["_measurement"] == "optimistic_slot")
  |> filter(fn: (r) => r["_field"] == "slot")  
  |> aggregateWindow(every: 1m, fn: mean)
  |> pivot(rowKey: ["_time"], columnKey: ["_field"], valueColumn: "_value")
  |> limit(n: 3)               // only 3 rows for each host
  //|> first(column: "slot")   // 5 points for each host



