#!/bin/bash

set -x

SOLANA_METRICS_CONFIG="host=https://metrics.solana.com:8086,db=tds,u=testnet_write,p=c4fa841aa918bf8274e3e2a44d77568d9861b3ea" /home/sol/stage/bin/solana-validator --dynamic-port-range 8002-8015 --gossip-port 8001 --identity /home/sol/identity/dev-server-sv15-identity.json --ledger /home/sol/ledger --limit-ledger-size --log /home/sol/logs/solana-validator.log --rpc-port 8899 --expected-genesis-hash 4uhcVJyU9pJkvQyS88uRDiswHXSCkY3zQawwpjk2NsNY --wal-recovery-mode skip_any_corrupted_record --no-voting --trusted-validator 5D1fNXzvv5NjV1ysLjirC4WY92RNsVH18vjmcszZd8on --halt-on-trusted-validators-accounts-hash-mismatch  --entrypoint entrypoint.testnet.solana.com:8001 --entrypoint entrypoint2.testnet.solana.com:8001 --entrypoint entrypoint3.testnet.solana.com:8001  --entrypoint entrypoint2.testnet.solana.com:8001 --entrypoint entrypoint3.testnet.solana.com:8001 &

