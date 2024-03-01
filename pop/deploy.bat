@echo on

plink -batch sol@%kin1% "gsutil cp /home/sol/stage512/bin/solana-validator gs://kin-snapshots/bin/solana-validator512"
plink -batch sol@%kin1% "gsutil cp /home/sol/stage512/bin/solana-ledger-tool gs://kin-snapshots/bin/solana-ledger-tool512"

REM pscp "sol@%kin1%:/home/sol/stage512/bin/solana-validator" solana-validator512
REM pscp "sol@%kin1%:/home/sol/stage512/bin/solana-ledger-tool" solana-ledger-tool512

set nodes=%pn1% %pn2% %pn3% %pn4%

set allnodes=%pn1% %pn2% %pn3% %pn4% %pn_rpc1% %pn_rpc2%
set rpcs=%pn_rpc1% %pn_rpc2%

for %%a in (%allnodes%) do (
    plink -batch sol@%%a "sudo ~/wipe_ledger.sh"
)


for %%a in (%nodes%) do (
    plink -batch sol@%%a "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator512 solana-validator && chmod u+x solana-validator"
    plink -batch sol@%%a "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-ledger-tool512 solana-ledger-tool && chmod u+x solana-ledger-tool"
    REM pscp ".\solana-validator512" "sol@%%a:/home/sol/.local/share/solana/install/active_release/bin/solana-validator"
    REM pscp ".\solana-ledger-tool512" "sol@%%a:/home/sol/.local/share/solana/install/active_release/bin/solana-ledger-tool"
    REM plink -batch sol@%%a "cd /home/sol/.local/share/solana/install/active_release/bin/ && chmod u+x solana-validator"
    REM plink -batch sol@%%a "cd /home/sol/.local/share/solana/install/active_release/bin/ && chmod u+x solana-ledger-tool"
)

for %%a in (%rpcs%) do (
    plink -batch sol@%%a "cd /home/sol/ && gsutil cp gs://kin-snapshots/bin/solana-validator512 solana-validator && chmod u+x solana-validator"
    plink -batch sol@%%a "cd /home/sol/ && gsutil cp gs://kin-snapshots/bin/solana-ledger-tool512 solana-ledger-tool && chmod u+x solana-ledger-tool"
    REM pscp .\solana-validator512 "sol@%%a:/home/sol/solana-validator"
    REM pscp .\solana-ledger-tool512 "sol@%%a:/home/sol/solana-ledger-tool"
    REM plink -batch sol@%%a "cd /home/sol/ && chmod u+x solana-validator"
    REM plink -batch sol@%%a "cd /home/sol/ && chmod u+x solana-ledger-tool"
)


::set SNAP=snapshot-1-GcxFVLGe3rkBz5zKWmNs7xbzRNdaY7jkrLVAwT51DNFK.tar.zst
set SNAP=snapshot-249022-CE7huwxE3hU3FyC8g8drr8rxEeqTqYJ1kJazPtcFzfA2.tar.zst
::set SNAP=snapshot-334940-9eXf6DSwMgxgryJRECj353M6BpqoHL1oQQZper4LZT6v.tar.zst
::set SNAP=snapshot-450351-EThvwYZeDoyV8MQDPWaTc1s2Q3RnKrpAU7PXGtUUhCaX.tar.zst incremental-snapshot-450351-622004-3RMNAGYJTDH5v6q4pYoXqJ5LcghGgYGHbW5YJD4fyt5L.tar.zst 

for %%a in (%allnodes%) do (
    for %%s in (%SNAP%) do (
         plink -batch sol@%%a "ln -s ~/%%s ~/ledger/%%s"
     )
)

::set START_SLOT_INFO=start_1.txt
set START_SLOT_INFO=..\start_249022.txt
::set START_SLOT_INFO=..\start_334940.txt
::set START_SLOT_INFO=..\start_622004.txt 
for %%a in (%allnodes%) do (
    pscp %START_SLOT_INFO% "sol@%%a:/home/sol/start_slot_info.txt" 
)


