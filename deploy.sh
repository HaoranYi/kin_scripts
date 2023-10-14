#!/bin/bash
set -ex

ssh sol@$kin1 "gsutil cp /home/sol/stage/bin/solana-validator gs://kin-snapshots/bin/solana-validator"
ssh sol@$kin1 "gsutil cp /home/sol/stage/bin/solana-ledger-tool gs://kin-snapshots/bin/solana-ledger-tool"

allnodes=($kin1 $kin2 $kin3 $kin4 $bm_rpc1 $bm_rpc2)
nodes=($kin1 $kin2 $kin3 $kin4)
rpcs=($bm_rpc1 $bm_rpc2)

for t in ${allnodes[@]}; do
    ssh sol@$t "sudo ~/wipe_ledger.sh"
done

for t in ${nodes[@]}; do
    ssh sol@$t "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
    ssh sol@$t "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-ledger-tool solana-ledger-tool && chmod u+x solana-ledger-tool"
done

for t in ${rpcs[@]}; do
    ssh sol@$t "cd /home/sol/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
    ssh sol@$t "cd /home/sol/ && gsutil cp gs://kin-snapshots/bin/solana-ledger-tool solana-ledger-tool && chmod u+x solana-ledger-tool"
done

SNAP=snapshot-249022-CE7huwxE3hU3FyC8g8drr8rxEeqTqYJ1kJazPtcFzfA2.tar.zst

for t in ${allnodes[@]}; do
    ssh sol@$t "ln -s ~/$SNAP ~/ledger/$SNAP"
done

START_SLOT_INFO=start_249022.txt
for t in ${allnodes[@]}; do
    scp $START_SLOT_INFO sol@$t:/home/sol/start_slot_info.txt 
done

