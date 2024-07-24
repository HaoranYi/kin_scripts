#!/bin/bash
set -ex

ssh sol@$pn1 "gsutil cp /home/sol/stage512/bin/solana-validator gs://kin-snapshots/bin/solana-validator512"
ssh sol@$pn1 "gsutil cp /home/sol/stage512/bin/solana-ledger-tool gs://kin-snapshots/bin/solana-ledger-tool512"

allnodes=($pn1 $pn2 $pn3 $pn4 $pn_rpc1 $pn_rpc2)
nodes=($pn1 $pn2 $pn3 $pn4)
rpcs=($pn_rpc1 $pn_rpc2)

for t in ${allnodes[@]}; do
    ssh sol@$t "sudo ~/wipe_ledger.sh"
done

for t in ${nodes[@]}; do
    ssh sol@$t "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator512 solana-validator && chmod u+x solana-validator"
    ssh sol@$t "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-ledger-tool512 solana-ledger-tool && chmod u+x solana-ledger-tool"
done

for t in ${rpcs[@]}; do
    ssh sol@$t "cd /home/sol/ && gsutil cp gs://kin-snapshots/bin/solana-validator512 solana-validator && chmod u+x solana-validator"
    ssh sol@$t "cd /home/sol/ && gsutil cp gs://kin-snapshots/bin/solana-ledger-tool512 solana-ledger-tool && chmod u+x solana-ledger-tool"
done

SNAP=snapshot-249022-CE7huwxE3hU3FyC8g8drr8rxEeqTqYJ1kJazPtcFzfA2.tar.zst

for t in ${allnodes[@]}; do
    ssh sol@$t "ln -s ~/$SNAP ~/ledger/$SNAP"
done

START_SLOT_INFO=../start_249022.txt
for t in ${allnodes[@]}; do
    scp $START_SLOT_INFO sol@$t:/home/sol/start_slot_info.txt 
done

