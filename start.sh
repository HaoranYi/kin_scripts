#!/bin/bash
set -ex

echo "====1 starting leader kin node ..."
ssh sol@$kin1 "~/restart"
ssh sol@$kin1 "tail -f logs/solana-validator.log | grep -m 1 \"Waiting for\""
echo "leader started"

echo "====2 starting other validator nodes ..."
ssh sol@$kin2 "~/restart"
ssh sol@$kin3 "~/restart"
ssh sol@$kin4 "~/restart"

sleep 60

ssh sol@$kin1 "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
ssh sol@$kin2 "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
ssh sol@$kin3 "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
ssh sol@$kin4 "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
echo "cluster new rooted"

echo "====3 starting rpc nodes ..."
ssh sol@$bm_rpc1 "~/boot-scripts.sh"
ssh sol@$bm_rpc2 "~/boot-scripts.sh"


ssh sol@$bm_rpc1 "tail -F solana-validator-7JcmM6TFZMkcDkZe6RKVkGaWwN5dXciGC4fa3RxvqQc9.log | grep -m 1 \"new root\""
ssh sol@$bm_rpc2 "tail -F solana-validator-AYJDiE3wgw5eanU4qJ4qfkB8vrHVEiBMTqXLbA9hUTaW.log | grep -m 1 \"new root\""

echo "rpc nodes started"

echo "====4 starting clients ..."
sleep 30
#ssh sol@$client1 "~/run-client.sh"
#ssh sol@$client2 "~/run-client.sh"
ssh sol@$bm_rpc1 "~/restart"
ssh sol@$bm_rpc2 "~/restart"

echo "done"

