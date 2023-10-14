@echo on

plink -batch sol@%kin1% "gsutil cp /home/sol/stage/bin/solana-validator gs://kin-snapshots/bin/solana-validator"
plink -batch sol@%kin1% "gsutil cp /home/sol/stage/bin/solana-ledger-tool gs://kin-snapshots/bin/solana-ledger-tool"

set nodes=%kin1% %kin2% %kin3% %kin4%

set allnodes=%kin1% %kin2% %kin3% %kin4% %bm_rpc1% %bm_rpc2%
set rpcs=%bm_rpc1% %bm_rpc2%

for %%a in (%allnodes%) do (
    plink -batch sol@%%a "sudo ~/wipe_ledger.sh"
)

for %%a in (%nodes%) do (
    plink -batch sol@%%a "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
    plink -batch sol@%%a "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-ledger-tool solana-ledger-tool && chmod u+x solana-ledger-tool"
)

for %%a in (%rpcs%) do (
    plink -batch sol@%%a "cd /home/sol/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
    plink -batch sol@%%a "cd /home/sol/ && gsutil cp gs://kin-snapshots/bin/solana-ledger-tool solana-ledger-tool && chmod u+x solana-ledger-tool"
)


::set SNAP=snapshot-1-GcxFVLGe3rkBz5zKWmNs7xbzRNdaY7jkrLVAwT51DNFK.tar.zst
set SNAP=snapshot-249022-CE7huwxE3hU3FyC8g8drr8rxEeqTqYJ1kJazPtcFzfA2.tar.zst

for %%a in (%allnodes%) do (
     ::plink -batch sol@%%a "cp ~/%SNAP% ~/ledger"
     plink -batch sol@%%a "ln -s ~/%SNAP% ~/ledger/%SNAP%"
)

::set START_SLOT_INFO=start_1.txt
set START_SLOT_INFO=start_249022.txt
for %%a in (%allnodes%) do (
    pscp %START_SLOT_INFO% "sol@%%a:/home/sol/start_slot_info.txt" 
)


