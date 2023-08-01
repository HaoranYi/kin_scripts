@echo on
set nodes=%pn1% %pn2% %pn3% %pn4% %pn_rpc1% %pn_rpc2%
::set nodes=%pn2% %pn3% %pn4% 

::set cmd="cp /etc/hostname ~/.hostname"
set cmd="ls -l /home/sol/ledger/*.zst"

for %%a in (%nodes%) do (
     plink -batch sol@%%a %cmd% 
)



::pscp "sol@%pn2%:/home/sol/ledger/contact-info.bin" .
::pscp contact-info.bin "sol@%pn_rpc1%:/home/sol/ledger/contact-info.bin" 
