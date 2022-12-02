#!/bin/bash

scp "sol@$kin1:/home/sol/start_slot_info.txt" .

nodes=($kin2 $kin3 $kin4 $rpc1 $rpc2)
for t in ${nodes[@]}; do
    scp start_slot_info.txt sol@$t:/home/sol/
done


