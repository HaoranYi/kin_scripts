// run: 
//    influx query --file epoch.flux
//    influx query --file epoch.flux --raw   # output csv
//
//
// query epoch timing
from(bucket: "mainnet-beta")
  |> range(start: 2022-08-14T23:55:00Z, stop: 2022-08-15T00:01:00Z)
  |> filter(fn: (r) => r["_measurement"] == "bank-new_from_parent-new_epoch_timings")
  |> filter(fn: (r) => r["_field"] == "load_vote_and_stake_accounts_us" or r["_field"] == "slot")  
  |> filter(fn: (r) => r["host_id"] == "26EqJ47BBf6r4fXSfPdmop4yJLuK2YZ5pbGCkM4bvMgE")
  |> pivot(rowKey: ["_time"], columnKey: ["_field"], valueColumn: "_value")
  |> map(fn: (r) => ({slot: r.slot,
  					  load: r.load_vote_and_stake_accounts_us }))
  |> sort(columns: ["slot"]) 
  |> drop(columns: ["result"])
  //|> filter(fn: (r) => r["slot"] == 146016008)
  //|> aggregateWindow(every: 1s, fn: max, createEmpty: false)
  |> yield(name: "max")
