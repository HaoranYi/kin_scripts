#!/bin/bash

set -ex

######################################
## A script to build pop512 validator and ledger tool for deployment ##
######################################

cd /home/sol/src/solana/validator && CI_COMMIT=$(git rev-parse HEAD) ../cargo build --release 
cd /home/sol/src/solana/ledger-tool/ && CI_COMMIT=$(git rev-parse HEAD) ../cargo build --release 
cd /home/sol/src/solana/target/release && ls -l agave-validator agave-ledger-tool 
cp agave-validator ~/stage512/bin/solana-validator 
cp agave-ledger-tool ~/stage512/bin/solana-ledger-tool
~/stage512/bin/solana-validator --version
~/stage512/bin/solana-ledger-tool --version
cd /home/sol/src/solana/ && git log -n1

