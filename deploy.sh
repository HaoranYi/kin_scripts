#!/bin/bash

ssh sol@$kin1 "gsutil cp /home/sol/stage/bin/solana-validator gs://kin-snapshots/bin/solana-validator"

allnodes=($kin1 $kin2 $kin3 $kin4 $rpc1 $rpc2)
nodes=($kin1 $kin2 $kin3 $kin4)
rpcs=($rpc1 $rpc2)


for t in ${nodes[@]}; do
    ssh sol@$t "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
done

for t in ${rpcs[@]}; do
    ssh sol@$t"cd /home/sol/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
done

for t in ${allnodes[@]}; do
    ssh sol@$t "~/wipe_ledger.sh"
done

SNAP=snapshot-99273-9XQgP53GH2bqHLvKGfAePHPAN9a1tNwYRo4s9EzoMfRw.tar.zst
#SNAP=snapshot-249289-FxH3fQKYTRdoxoCvxMsMvjyr7GQRveaNftPTKmyTdMhf.tar.zst
for t in ${allnodes[@]}; do
    ssh sol@$t "cp ~/$SNAP ~/ledger"
done
