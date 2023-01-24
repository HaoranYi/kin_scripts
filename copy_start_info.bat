@echo on

::pscp "sol@%kin1%:/home/sol/start_slot_info.txt" .

set nodes=%kin1% %kin2% %kin3% %kin4% %rpc1% %rpc2%

for %%a in (%nodes%) do (
    pscp start_1100000.txt "sol@%%a:/home/sol/start_slot_info.txt" 
)


