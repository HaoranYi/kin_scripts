haha3

# Edfkf9gpC7KpnkNdKRPmseCtkE1zY8fUVRJMbiLYKKdK PmXohrohcmtKdeeeYygU4q9wSxujSJLmdVBEbmHhyXa Hij7dbmLSK5fj4Qwo9zM4wqPti28ZYLJLG3oU5M181f7
validator-identity-da11-1.json: Edfkf9gpC7KpnkNdKRPmseCtkE1zY8fUVRJMbiLYKKdK
validator-vote-account-da11-1.json: PmXohrohcmtKdeeeYygU4q9wSxujSJLmdVBEbmHhyXa
validator-stake-account-da11-1.json: Hij7dbmLSK5fj4Qwo9zM4wqPti28ZYLJLG3oU5M181f7

# 2k31vk7hPiu2T9fJzuunc6tmaE57P7wt6tFoGK5A7k47 DJuHQCQrvPRYhNsqTFyvfEEpzypHdBibeidkL5VqSsCx AokbnmuQJ9uCNSen6rW5R9NHkRd43xURknKcy3JTD3mi
validator-identity-ny5-1.json: 2k31vk7hPiu2T9fJzuunc6tmaE57P7wt6tFoGK5A7k47
validator-vote-account-ny5-1.json: DJuHQCQrvPRYhNsqTFyvfEEpzypHdBibeidkL5VqSsCx
validator-stake-account-ny5-1.json: AokbnmuQJ9uCNSen6rW5R9NHkRd43xURknKcy3JTD3mi

# 3cVWsRiTXD99BXNhzXs7Gkm3YBhCDrMQWnLern8B7TrD Dou12zNcGLyDeLcxeRGzQ2xBx1orSWg9AKyuWBgfKREp 7jbYYZHc4wG4pf8E4r3VXEeJFHxAKSb7aJwrNa7mA2zK
validator-identity-sg1-1.json: 3cVWsRiTXD99BXNhzXs7Gkm3YBhCDrMQWnLern8B7TrD
validator-vote-account-sg1-1.json: Dou12zNcGLyDeLcxeRGzQ2xBx1orSWg9AKyuWBgfKREp
validator-stake-account-sg1-1.json: 7jbYYZHc4wG4pf8E4r3VXEeJFHxAKSb7aJwrNa7mA2zK


solana-genesis
  --bootstrap-validator-stake-lamports 1000000000000
  --faucet-lamports 500000000000000000
  --slots-per-epoch 432000
  --bootstrap-validator /home/sol/identity/validator-identity-am6-1.json /home/sol/identity/validator-vote-account-am6-1.json /home/sol/identity/validator-stake-account-am6-1.json
  --bootstrap-validator Edfkf9gpC7KpnkNdKRPmseCtkE1zY8fUVRJMbiLYKKdK PmXohrohcmtKdeeeYygU4q9wSxujSJLmdVBEbmHhyXa Hij7dbmLSK5fj4Qwo9zM4wqPti28ZYLJLG3oU5M181f7
  --bootstrap-validator 2k31vk7hPiu2T9fJzuunc6tmaE57P7wt6tFoGK5A7k47 DJuHQCQrvPRYhNsqTFyvfEEpzypHdBibeidkL5VqSsCx AokbnmuQJ9uCNSen6rW5R9NHkRd43xURknKcy3JTD3mi
  --bootstrap-validator 3cVWsRiTXD99BXNhzXs7Gkm3YBhCDrMQWnLern8B7TrD Dou12zNcGLyDeLcxeRGzQ2xBx1orSWg9AKyuWBgfKREp 7jbYYZHc4wG4pf8E4r3VXEeJFHxAKSb7aJwrNa7mA2zK
  --max-genesis-archive-unpacked-size 1073741824
  --enable-warmup-epochs
  --bpf-program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA BPFLoader2111111111111111111111111111111111 spl_token-3.5.0.so
  --bpf-program Memo1UhkJRfHyvLMcVucJwxXeuD728EqVDDwQDxFMNo BPFLoader1111111111111111111111111111111111 spl_memo-1.0.0.so
  --bpf-program MemoSq4gqABAXKb96qnH8TysNcWxMyWCqXgDLGmfcHr BPFLoader2111111111111111111111111111111111 spl_memo-3.0.0.so
  --bpf-program ATokenGPvbdGVxr1b2hvZbsiqW5xWH25efTNsLJA8knL BPFLoader2111111111111111111111111111111111 spl_associated-token-account-1.1.2.so
  --bpf-program Feat1YXHhH6t1juaWF74WLcfv4XoNocjXA6sPWHNgAse BPFLoader2111111111111111111111111111111111 spl_feature-proposal-1.0.0.so
  --ledger /home/sol/ledger 
  --faucet-pubkey /home/sol/identity/faucet.json
  --hashes-per-tick auto
  --cluster-type development

