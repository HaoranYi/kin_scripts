@echo on 

:: copy gs snapshot files to all nodes

set allnodes=%pn1% %pn2% %pn3% %pn_rpc1% %pn_rpc2%
set SNAP=snapshot-450351-EThvwYZeDoyV8MQDPWaTc1s2Q3RnKrpAU7PXGtUUhCaX.tar.zst incremental-snapshot-450351-622004-3RMNAGYJTDH5v6q4pYoXqJ5LcghGgYGHbW5YJD4fyt5L.tar.zst 

for %%a in (%allnodes%) do (
    for %%s in (%SNAP%) do (
         ::plink -batch sol@%%a "ln -s ~/%SNAP% ~/ledger/%SNAP%"
         ::echo plink -batch sol@%%a "ln -s ~/%%s ~/ledger/%%s"
         start plink -batch sol@%%a "gsutil cp gs://kin-snapshots/snapshot/%%s ~/"
     )
)

pause

