@echo on

plink -batch sol@%client1% "~/run-client.sh"
plink -batch sol@%client2% "~/run-client.sh"

