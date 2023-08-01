#!/bin/bash

ssh sol@$kin1 '~/stop'
ssh sol@$kin2 '~/stop'
ssh sol@$kin3 '~/stop'
ssh sol@$kin4 '~/stop'
ssh sol@$bm_rpc1 'pkill -9 -f solana-validator'
ssh sol@$bm_rpc2 'pkill -9 -f solana-validator'

ssh sol@$bm_rpc1 "~/stop"
ssh sol@$bm_rpc2 "~/stop"

ssh sol@$kin1 'systemctl status sol'
ssh sol@$kin2 'systemctl status sol'
ssh sol@$kin3 'systemctl status sol'
ssh sol@$kin4 'systemctl status sol'
ssh sol@$bm_rpc1 'ps -aux | grep solana-validator'
ssh sol@$bm_rpc2 'ps -aux | grep solana-validator' 

ssh sol@$bm_rpc1 "systemctl status kin.client"
ssh sol@$bm_rpc2 "systemctl status kin.client"
