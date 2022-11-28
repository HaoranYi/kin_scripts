@echo on

echo "run sys-tuner ..."

plink -batch sol@%kin1% "bash -c 'sudo ~/stage/bin/solana-sys-tuner --user sol' >sys_tuner.log >2>&1 &"
plink -batch sol@%kin2% "bash -c 'sudo ~/stage/bin/solana-sys-tuner --user sol' >sys_tuner.log >2>&1 &"
plink -batch sol@%kin3% "bash -c 'sudo ~/stage/bin/solana-sys-tuner --user sol' >sys_tuner.log >2>&1 &"
plink -batch sol@%kin4% "bash -c 'sudo ~/stage/bin/solana-sys-tuner --user sol' >sys_tuner.log >2>&1 &"

plink -batch sol@%rpc1% "bash -c 'sudo ~/stage/bin/solana-sys-tuner --user sol' >sys_tuner.log >2>&1 &"
plink -batch sol@%rpc2% "bash -c 'sudo ~/stage/bin/solana-sys-tuner --user sol' >sys_tuner.log >2>&1 &"

echo "done"
