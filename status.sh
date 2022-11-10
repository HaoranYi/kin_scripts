#!/bin/bash

ssh sol@$kin1 'systemctl status sol'
ssh sol@$kin2 'systemctl status sol'
ssh sol@$kin3 'systemctl status sol'
ssh sol@$kin4 'systemctl status sol'
ssh sol@$rpc1 'ps -aux | grep solana-validator'
ssh sol@$rpc2 'ps -aux | grep solana-validator' 


