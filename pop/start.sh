#!/bin/bash
set -ex

# popnet 512

echo "====1 starting leader pn node ..."
ssh sol@$pn1 "~/restart"
ssh sol@$pn1 "tail -f logs/solana-validator.log | grep -m 1 \"Waiting for\""
echo "leader started"

echo "====2 starting other validator nodes ..."
ssh sol@$pn2 "~/restart"
ssh sol@$pn3 "~/restart"
ssh sol@$pn4 "~/restart"

sleep 60

ssh sol@$pn1 "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
ssh sol@$pn2 "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
ssh sol@$pn3 "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
ssh sol@$pn4 "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
echo "cluster new rooted"

echo "====3 starting rpc nodes ..."
ssh sol@$pn_rpc1 "~/boot-scripts.sh"
ssh sol@$pn_rpc2 "~/boot-scripts.sh"


ssh sol@$pn_rpc1 "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
ssh sol@$pn_rpc2 "tail -F logs/solana-validator.log | grep -m 1 \"new root\""

echo "rpc nodes started"

echo "====4 starting clients ..."
sleep 30
ssh sol@$pn_rpc1 "~/restart"
ssh sol@$pn_rpc2 "~/restart"

echo "done"

