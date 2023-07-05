@echo on

plink -batch sol@%pn1% "~/stop"
plink -batch sol@%pn2% "~/stop"
plink -batch sol@%pn3% "~/stop"
plink -batch sol@%pn4% "~/stop"
plink -batch sol@%pn_rpc1% "sudo pkill -9 -f solana-validator"
plink -batch sol@%pn_rpc2% "sudo pkill -9 -f solana-validator"

plink -batch sol@%pn_rpc1% "~/stop"
plink -batch sol@%pn_rpc2% "~/stop"

plink -batch sol@%pn1% "systemctl status sol"
plink -batch sol@%pn2% "systemctl status sol"
plink -batch sol@%pn3% "systemctl status sol"
plink -batch sol@%pn4% "systemctl status sol"
plink -batch sol@%pn_rpc1% "ps -aux | grep solana-validator"
plink -batch sol@%pn_rpc2% "ps -aux | grep solana-validator" 

plink -batch sol@%pn_rpc1% "systemctl status kin.client"
plink -batch sol@%pn_rpc2% "systemctl status kin.client"


