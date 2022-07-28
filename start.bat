@echo on

plink -batch sol@%kin1% "~/restart"
plink -batch sol@%kin1% "tail -f logs/solana-validator.log | grep -m 1 \"Waiting for\""


plink -batch sol@%kin2% "~/restart"
plink -batch sol@%kin3% "~/restart"
plink -batch sol@%kin4% "~/restart"


plink -batch sol@%kin1% "tail -f logs/solana-validator.log | grep -m 1 \"new root\""
plink -batch sol@%kin2% "tail -f logs/solana-validator.log | grep -m 1 \"new root\""
plink -batch sol@%kin3% "tail -f logs/solana-validator.log | grep -m 1 \"new root\""
plink -batch sol@%kin4% "tail -f logs/solana-validator.log | grep -m 1 \"new root\""


plink -batch sol@%rpc1% "~/boot-scripts.sh"
plink -batch sol@%rpc2% "~/boot-scripts.sh"


plink -batch sol@%rpc1% "tail -f solana-validator-7JcmM6TFZMkcDkZe6RKVkGaWwN5dXciGC4fa3RxvqQc9.log | grep -m 1 \"new root\""
plink -batch sol@%rpc2% "tail -f solana-validator-AYJDiE3wgw5eanU4qJ4qfkB8vrHVEiBMTqXLbA9hUTaW.log | grep -m 1 \"new root\""

:: sleep for 10s
ping -n 11 127.0.0.1 > nul

plink -batch sol@%client1% "~/run-client.sh"
plink -batch sol@%client2% "~/run-client.sh"

