:: check validator version 

set nodes=%pn1% %pn2% %pn3% %pn4% %pn_rpc1% %pn_rpc2%
 for %%a in (%nodes%) do (
      plink -batch sol@%%a "/home/sol/.local/share/solana/install/active_release/bin/solana-validator --version" 
 )
:
