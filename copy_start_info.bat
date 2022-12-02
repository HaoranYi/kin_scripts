@echo on

pscp "sol@%kin1%:/home/sol/start_slot_info.txt" .

set targets=%kin2% %kin3% %kin4% %rpc1% %rpc2%

for %%a in (%targets%) do (
    pscp start_slot_info.txt "sol@%%a:/home/sol/start_slot_info.txt" 
)


