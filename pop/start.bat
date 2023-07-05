@echo on

echo "starting leader pn nodes ..."
plink -batch sol@%pn1% "~/restart"

echo "waiting for leader starting"
timeout 60
plink -batch sol@%pn1% "tail -F logs/solana-validator.log | grep -m 1 \"Waiting for\""
:: plink -batch sol@%pn1% "tail -F logs/solana-validator.log | grep -m 1 \"new root\""

echo "starting other pn nodes ..."
plink -batch sol@%pn2% "~/restart"
plink -batch sol@%pn3% "~/restart"
plink -batch sol@%pn4% "~/restart"

echo "waiting for starting"
timeout 60

plink -batch sol@%pn1% "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
plink -batch sol@%pn2% "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
plink -batch sol@%pn3% "tail -F logs/solana-validator.log | grep -m 1 \"new root\""
plink -batch sol@%pn4% "tail -F logs/solana-validator.log | grep -m 1 \"new root\""

exit 0

echo "starting rpc nodes ..."
timeout 10
plink -batch sol@%pn_rpc1% "~/boot-scripts.sh"
plink -batch sol@%pn_rpc2% "~/boot-scripts.sh"

timeout 60
plink -batch sol@%pn_rpc1% "tail -F solana-validator-7JcmM6TFZMkcDkZe6RKVkGaWwN5dXciGC4fa3RxvqQc9.log | grep -m 1 \"new root\""
plink -batch sol@%pn_rpc2% "tail -F solana-validator-AYJDiE3wgw5eanU4qJ4qfkB8vrHVEiBMTqXLbA9hUTaW.log | grep -m 1 \"new root\""


echo "starting clients ..."
timeout 60
:: plink -batch sol@%pn_client1% "~/run-client.sh"
:: plink -batch sol@%pn_client2% "~/run-client.sh"
plink -batch sol@%pn_rpc1% "~/restart"
plink -batch sol@%pn_rpc2% "~/restart"

echo "done"
