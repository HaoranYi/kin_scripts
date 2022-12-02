@echo on

pscp "sol@%kin1%:/home/sol/start_slot_info.txt" .
pscp start_slot_info.txt "sol@%kin2%:/home/sol/start_slot_info.txt" 
pscp start_slot_info.txt "sol@%kin3%:/home/sol/start_slot_info.txt" 
pscp start_slot_info.txt "sol@%kin4%:/home/sol/start_slot_info.txt" 
pscp start_slot_info.txt "sol@%rpc1%:/home/sol/start_slot_info.txt" 
pscp start_slot_info.txt "sol@%rpc2%:/home/sol/start_slot_info.txt"

