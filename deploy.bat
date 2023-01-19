@echo on

plink -batch sol@%kin1% "gsutil cp /home/sol/stage/bin/solana-validator gs://kin-snapshots/bin/solana-validator"

set allnodes=%kin1% %kin2% %kin3% %kin4% %rpc1% %rpc2%
set nodes=%kin1% %kin2% %kin3% %kin4%
set rpcs=%rpc1% %rpc2%

for %%a in (%nodes%) do (
    plink -batch sol@%%a "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
)

for %%a in (%rpcs%) do (
    plink -batch sol@%%a "cd /home/sol/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
)


for %%a in (%allnodes%) do (
    plink -batch sol@%%a "~/wipe_ledger.sh"
)

set SNAP=snapshot-1-GcxFVLGe3rkBz5zKWmNs7xbzRNdaY7jkrLVAwT51DNFK.tar.zst
::set SNAP=snapshot-99273-9XQgP53GH2bqHLvKGfAePHPAN9a1tNwYRo4s9EzoMfRw.tar.zst
::set SNAP=snapshot-974272-CbnFsVq3tjidfKdg4tt6apoYCL5aAi3vNbA3YufMWtTH.tar.zst
::set SNAP=snapshot-1624473-9XzcZKrihArxJyEY3DvP86dH1wfYvnYk1V9N9QPQpvtm.tar.zst

for %%a in (%allnodes%) do (
     plink -batch sol@%%a "cp ~/%SNAP% ~/ledger"
)

set START_SLOT_INFO=start_1.txt
::set START_SLOT_INFO=start_99273.txt
for %%a in (%allnodes%) do (
    pscp %START_SLOT_INFO% "sol@%%a:/home/sol/start_slot_info.txt" 
)


