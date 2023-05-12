@echo on

plink -batch sol@%kin1% "~/stop"
plink -batch sol@%kin2% "~/stop"
plink -batch sol@%kin3% "~/stop"
plink -batch sol@%kin4% "~/stop"
plink -batch sol@%bm_rpc1% "sudo pkill -9 -f solana-validator"
plink -batch sol@%bm_rpc2% "sudo pkill -9 -f solana-validator"

plink -batch sol@%client1% "~/stop"
plink -batch sol@%client2% "~/stop"

plink -batch sol@%kin1% "systemctl status sol"
plink -batch sol@%kin2% "systemctl status sol"
plink -batch sol@%kin3% "systemctl status sol"
plink -batch sol@%kin4% "systemctl status sol"
plink -batch sol@%rpc1% "ps -aux | grep solana-validator"
plink -batch sol@%rpc2% "ps -aux | grep solana-validator" 

plink -batch sol@%client1% "systemctl status kin.client"
plink -batch sol@%client2% "systemctl status kin.client"


