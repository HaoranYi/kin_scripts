:: popnet 512

@echo on

echo "====1 starting leader pn node ..."
plink -batch sol@%pn1% "~/restart"

timeout /nobreak 60
:repeat_wait_for_leader
plink -batch sol@%pn1% "tail -n500 logs/solana-validator.log | grep \"Waiting for\""
if %ERRORLEVEL% NEQ 0 (
    echo "retry wait for leader"
    timeout /nobreak 30
    GOTO repeat_wait_for_leader
)
echo "leader started"

echo "====2 starting other validator nodes ..."
plink -batch sol@%pn2% "~/restart"
plink -batch sol@%pn3% "~/restart"
plink -batch sol@%pn4% "~/restart"

timeout /nobreak 60
:repeat_wait_for_new_roots
plink -batch sol@%pn1% "tail -n500 logs/solana-validator.log | grep -m 1 \"new root\"" ^
&& plink -batch sol@%pn2% "tail -n500 logs/solana-validator.log | grep -m 1 \"new root\"" ^
&& plink -batch sol@%pn3% "tail -n500 logs/solana-validator.log | grep -m 1 \"new root\"" ^
&& plink -batch sol@%pn4% "tail -n500 logs/solana-validator.log | grep -m 1 \"new root\""
if %ERRORLEVEL% NEQ 0 (
    echo "retry wait for new roots"
    timeout /nobreak 30
    GOTO repeat_wait_for_new_roots
)
echo "cluster new rooted"

echo "====3 starting rpc nodes ..."
timeout /nobreak 10
plink -batch sol@%pn_rpc1% "~/boot-scripts.sh"
plink -batch sol@%pn_rpc2% "~/boot-scripts.sh"

timeout /nobreak 60
:repeat_wait_for_rpc_nodes
plink -batch sol@%pn_rpc1% "tail -n500 solana-validator-*.log | grep -m 1 \"new root\"" ^
&& plink -batch sol@%pn_rpc2% "tail -n500 solana-validator-*.log | grep -m 1 \"new root\""
if %ERRORLEVEL% NEQ 0 (
    echo "retry wait for rpc nodes"
    timeout /nobreak 30
    GOTO repeat_wait_for_rpc_nodes
)
echo "rpc nodes started"

echo "====4 starting clients ..."
timeout /nobreak 60
plink -batch sol@%pn_rpc1% "~/restart"
plink -batch sol@%pn_rpc2% "~/restart"

:end
echo "done"
