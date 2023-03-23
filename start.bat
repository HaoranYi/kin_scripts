@echo on

echo "starting leader kin nodes ..."
plink -batch sol@%kin1% "~/restart"

echo "waiting for leader starting"
timeout 650
:: plink -batch sol@%kin1% "tail -F logs/solana-validator.log | grep -m 1 \"Waiting for\""
plink -batch sol@%kin1% "tail -F logs/solana-validator.log | grep -m 1 \"new root\""

echo "starting other kin nodes ..."
plink -batch sol@%kin2% "~/restart"
plink -batch sol@%kin3% "~/restart"
plink -batch sol@%kin4% "~/restart"

echo "waiting for starting"
timeout 650

plink -batch sol@%kin1% "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
plink -batch sol@%kin2% "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
plink -batch sol@%kin3% "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
plink -batch sol@%kin4% "tail -F logs/solana-validator.log | grep -m 1 \"new root\""

echo "starting rpc nodes ..."
timeout 10
plink -batch sol@%rpc1% "~/boot-scripts.sh"
plink -batch sol@%rpc2% "~/boot-scripts.sh"

timeout 10
plink -batch sol@%rpc1% "tail -F solana-validator-7JcmM6TFZMkcDkZe6RKVkGaWwN5dXciGC4fa3RxvqQc9.log | grep -m 1 \"new root\""
plink -batch sol@%rpc2% "tail -F solana-validator-AYJDiE3wgw5eanU4qJ4qfkB8vrHVEiBMTqXLbA9hUTaW.log | grep -m 1 \"new root\""


echo "starting clients ..."
timeout 30
:: plink -batch sol@%client1% "~/run-client.sh"
:: plink -batch sol@%client2% "~/run-client.sh"
plink -batch sol@%client1% "~/restart"
plink -batch sol@%client2% "~/restart"

echo "done"
