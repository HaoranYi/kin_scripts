#!/bin/bash

ssh sol@$pn1'~/stop'
ssh sol@$pn2 '~/stop'
ssh sol@$pn3 '~/stop'
ssh sol@$pn4 '~/stop'
ssh sol@$pn_rpc1 'pkill -9 -f solana-validator'
ssh sol@$pn_rpc2 'pkill -9 -f solana-validator'

ssh sol@$pn_rpc1 "~/stop"
ssh sol@$pn_rpc2 "~/stop"

ssh sol@$pn1 'systemctl status sol'
ssh sol@$pn2 'systemctl status sol'
ssh sol@$pn3 'systemctl status sol'
ssh sol@$pn4 'systemctl status sol'
ssh sol@$pn_rpc1 'ps -aux | grep solana-validator'
ssh sol@$pn_rpc2 'ps -aux | grep solana-validator' 

ssh sol@$pn_rpc1 "systemctl status kin.client"
ssh sol@$pn_rpc2 "systemctl status kin.client"
