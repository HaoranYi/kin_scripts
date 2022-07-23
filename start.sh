#!/bin/bash

ssh sol@$kin1 "~/restart"
ssh sol@$kin1 "tail -f logs/solana-validator.log | grep -m 1 \"Waiting for\""


ssh sol@$kin2 "~/restart"
ssh sol@$kin3 "~/restart"
ssh sol@$kin4 "~/restart"


ssh sol@$kin1 "tail -f logs/solana-validator.log | grep -m 1 \"new root\""
ssh sol@$kin2 "tail -f logs/solana-validator.log | grep -m 1 \"new root\""
ssh sol@$kin3 "tail -f logs/solana-validator.log | grep -m 1 \"new root\""
ssh sol@$kin4 "tail -f logs/solana-validator.log | grep -m 1 \"new root\""


ssh sol@$rpc1 "~/boot-scripts.sh"
ssh sol@$rpc2 "~/boot-scripts.sh"


ssh sol@$rpc1 "tail -f solana-validator-7JcmM6TFZMkcDkZe6RKVkGaWwN5dXciGC4fa3RxvqQc9.log | grep -m 1 \"new root\""
ssh sol@$rpc2 "tail -f solana-validator-AYJDiE3wgw5eanU4qJ4qfkB8vrHVEiBMTqXLbA9hUTaW.log | grep -m 1 \"new root\""


ssh sol@$rpc1 "~/run-client.sh"
ssh sol@$rpc2 "~/run-client.sh"

