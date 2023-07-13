:: kin 256

@echo on

echo "====1 starting leader kin node ..."
plink -batch sol@%kin1% "~/restart"

timeout 60
:repeat_wait_for_leader
plink -batch sol@%kin1% "tail -n500 logs/solana-validator.log | grep \"Waiting for\""
if %ERRORLEVEL% NEQ 0 (
    echo "retry wait for leader"
    timeout 30
    GOTO repeat_wait_for_leader
)
echo "leader started"

echo "====2 starting other validator nodes ..."
plink -batch sol@%kin2% "~/restart"
plink -batch sol@%kin3% "~/restart"
plink -batch sol@%kin4% "~/restart"

timeout 60
:repeat_wait_for_new_roots
plink -batch sol@%kin1% "tail -n500 logs/solana-validator.log | grep -m 1 \"new root\"" ^
&& plink -batch sol@%kin2% "tail -n500 logs/solana-validator.log | grep -m 1 \"new root\"" ^
&& plink -batch sol@%kin3% "tail -n500 logs/solana-validator.log | grep -m 1 \"new root\"" ^
&& plink -batch sol@%kin4% "tail -n500 logs/solana-validator.log | grep -m 1 \"new root\""
if %ERRORLEVEL% NEQ 0 (
    echo "retry wait for new roots"
    timeout 30
    GOTO repeat_wait_for_new_roots
)
echo "cluster new rooted"

echo "====3 starting rpc nodes ..."
timeout 10
plink -batch sol@%bm_rpc1% "~/boot-scripts.sh"
plink -batch sol@%bm_rpc2% "~/boot-scripts.sh"

timeout 60
:repeat_wait_for_rpc_nodes
plink -batch sol@%bm_rpc1% "tail -n500 solana-validator-*.log | grep -m 1 \"new root\"" ^
&& plink -batch sol@%bm_rpc2% "tail -n500 solana-validator-*.log | grep -m 1 \"new root\""
if %ERRORLEVEL% NEQ 0 (
    echo "retry wait for rpc nodes"
    timeout 30
    GOTO repeat_wait_for_rpc_nodes
)
echo "rpc nodes started"

echo "====4 starting clients ..."
timeout 60
plink -batch sol@%bm_rpc1% "~/restart"
plink -batch sol@%bm_rpc2% "~/restart"

:end
echo "done"

