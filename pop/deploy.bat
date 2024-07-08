@echo on

:: build and copy agave_validator/agave_ledger-tool to ~/stage512/bin/
:: see `build.sh` 

plink -batch sol@%pn1% "gsutil cp /home/sol/stage512/bin/solana-validator gs://kin-snapshots/bin/solana-validator512"
plink -batch sol@%pn1% "gsutil cp /home/sol/stage512/bin/solana-ledger-tool gs://kin-snapshots/bin/solana-ledger-tool512"

set nodes=%pn1% %pn2% %pn3% %pn4%

set allnodes=%pn1% %pn2% %pn3% %pn4% %pn_rpc1% %pn_rpc2%
set rpcs=%pn_rpc1% %pn_rpc2%

for %%a in (%allnodes%) do (
    plink -batch sol@%%a "sudo ~/wipe_ledger.sh"
)


for %%a in (%nodes%) do (
    plink -batch sol@%%a "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator512 solana-validator && chmod u+x solana-validator"
    plink -batch sol@%%a "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-ledger-tool512 solana-ledger-tool && chmod u+x solana-ledger-tool"
)

for %%a in (%rpcs%) do (
    plink -batch sol@%%a "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator512 solana-validator && chmod u+x solana-validator"
    plink -batch sol@%%a "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-ledger-tool512 solana-ledger-tool && chmod u+x solana-ledger-tool"
)


set SNAP=snapshot-249022-CE7huwxE3hU3FyC8g8drr8rxEeqTqYJ1kJazPtcFzfA2.tar.zst

for %%a in (%allnodes%) do (
    for %%s in (%SNAP%) do (
         plink -batch sol@%%a "ln -s ~/%%s ~/ledger/%%s"
     )
)

set START_SLOT_INFO=..\start_249022.txt
for %%a in (%allnodes%) do (
    pscp %START_SLOT_INFO% "sol@%%a:/home/sol/start_slot_info.txt" 
)


