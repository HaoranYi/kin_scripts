@echo on

plink -batch sol@%kin1% "~/stop"
plink -batch sol@%kin2% "~/stop"
plink -batch sol@%kin3% "~/stop"
plink -batch sol@%kin4% "~/stop"
plink -batch sol@%rpc1% "pkill -9 -f solana-validator"
plink -batch sol@%rpc2% "pkill -9 -f solana-validator"


plink -batch sol@%kin1% "systemctl status sol"
plink -batch sol@%kin2% "systemctl status sol"
plink -batch sol@%kin3% "systemctl status sol"
plink -batch sol@%kin4% "systemctl status sol"
plink -batch sol@%rpc1% "ps -aux | grep solana-validator"
plink -batch sol@%rpc2% "ps -aux | grep solana-validator" 


