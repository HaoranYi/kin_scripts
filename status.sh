#!/bin/bash

ssh sol@$kin1 'systemctl status sol'
ssh sol@$kin2 'systemctl status sol'
ssh sol@$kin3 'systemctl status sol'
ssh sol@$kin4 'systemctl status sol'
ssh sol@$bm_rpc1 'ps -aux | grep solana-validator'
ssh sol@$bm_rpc2 'ps -aux | grep solana-validator' 


