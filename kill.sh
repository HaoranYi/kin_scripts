#!/bin/bash

ssh sol@$kin1 '~/stop'
ssh sol@$kin2 '~/stop'
ssh sol@$kin3 '~/stop'
ssh sol@$kin4 '~/stop'
ssh sol@$rpc1 'pkill -9 -f solana-validator'
ssh sol@$rpc2 'pkill -9 -f solana-validator'


ssh sol@$kin1 'systemctl status sol'
ssh sol@$kin2 'systemctl status sol'
ssh sol@$kin3 'systemctl status sol'
ssh sol@$kin4 'systemctl status sol'
ssh sol@$rpc1 'ps -aux | grep solana-validator'
ssh sol@$rpc2 'ps -aux | grep solana-validator' 


