#!/bin/bash

# TODO adapt for linux
ssh sol@gkin1 '~/stop'
plink -batch sol@gkin2 '~/stop'
plink -batch sol@gkin3 '~/stop'
plink -batch sol@gkin4 '~/stop'
plink -batch sol@grpc1 'pkill -9 -f solana-validator'
plink -batch sol@grpc2 'pkill -9 -f solana-validator'


plink -batch sol@gkin1 'systemctl status sol'
plink -batch sol@gkin2 'systemctl status sol'
plink -batch sol@gkin3 'systemctl status sol'
plink -batch sol@gkin4 'systemctl status sol'
plink -batch sol@grpc1 'ps -aux | grep solana-validator'
plink -batch sol@grpc2 'ps -aux | grep solana-validator' 


