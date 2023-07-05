#!/usr/bin/env bash 
set -ex

LEDGER=./ledger

rm -rf $LEDGER/accounts
rm -rf $LEDGER/accounts_index
rm -rf $LEDGER/accounts_hash_cache
rm -rf $LEDGER/rocksdb
rm -rf $LEDGER/snapshot
rm -rf $LEDGER/snapshot*.tar.zst
rm -rf $LEDGER/incremental-snapshot*.zst
rm -rf $LEDGER/tower*.bin

