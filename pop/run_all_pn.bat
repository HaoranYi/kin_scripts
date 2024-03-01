@echo on
::set nodes=%kin1% %kin2% %kin3% %kin4% %bm_rpc1% %bm_rpc2%
::set nodes=%pn1% %pn2% %pn3% %pn4% %pn_rpc1% %pn_rpc2%
set nodes=%pn1% %pn2% %pn3% %pn4% 
::set nodes=%pn2% %pn3% %pn4% 

::set cmd="cp /etc/hostname ~/.hostname"
::set cmd = sudo sysctl -p /etc/sysctl.d/21-solana-validator.conf
::set cmd="ls -l /home/sol/ledger/*.zst"

::perf tools
::set cmd="sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install linux-tools-common linux-tools-generic linux-tools-`uname -r`"
:: -- adjust root right to run perf-tools
::set cmd="sudo sh -c 'echo 1 >/proc/sys/kernel/perf_event_paranoid'"
:: set cmd="sudo sysctl -w kernel.perf_event_paranoid=1"  
:: To ensure this is done at boot time create your own
:: /etc/sysctl.d/99-mysetting.conf file with
::   kernel.perf_event_paranoid=1
:: choose a filename that won't override existing file in `/run/sysctrl.d` and `/usr/lib/sysctrl.d/`
:: see man sysctrl.d for details
:: set cmd="sudo perf stat -e page-faults --timeout 5000"

:: set cmd="grep 'voting: 5564[45]' ~/logs/solana-validator.log"
:: 
:: for %%a in (%nodes%) do (
::      plink -batch sol@%%a %cmd% 
:: )
:: 


::pscp "sol@%pn2%:/home/sol/ledger/contact-info.bin" .
::pscp contact-info.bin "sol@%pn_rpc1%:/home/sol/ledger/contact-info.bin" 
::
pscp ".\solana-validator512_2" "sol@%pn2%:/home/sol/.local/share/solana/install/active_release/bin/solana-validator"
plink -batch sol@%pn2% "cd /home/sol/.local/share/solana/install/active_release/bin/ && chmod u+x solana-validator"
pscp ".\solana-validator512_2" "sol@%pn3%:/home/sol/.local/share/solana/install/active_release/bin/solana-validator"
plink -batch sol@%pn3% "cd /home/sol/.local/share/solana/install/active_release/bin/ && chmod u+x solana-validator"

pscp .\solana-validator512_2 "sol@%pn_rpc2%:/home/sol/solana-validator"
plink -batch sol@%pn_rpc2% "cd /home/sol/ && chmod u+x solana-validator"
