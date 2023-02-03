#!/bin/bash

HOST=https://api.mainnet-beta.solana.com 

# curl $HOST -X POST -H "Content-Type: application/json" -d '
#   {
#     "jsonrpc": "2.0",
#     "id": 1,
#     "method": "getBalance",
#     "params": [
#       "Ghfh52pL9m3Q6KsiS7nWBLStqSHox2AKPs5pWC7ex6k2"
#     ]
#   }
# '


L=(
  4FdZkX5KaqcZNuTZZKVRqw5zWtjth7A6dpvrQk5aTiVGfy3G7Csi2WdojixdVtF3vmDmN4g3t8qB95VdPUQMY3a7 \
  SLwiDVYWw6zfRhz2w6SaEjbV8pF4hu9cDyFqAChzAD8Z6nMXV2or7HT7JubsDQJgss9S5z1UK9qf416AbwSB6sU
  )

for x in ${L[*]}; do
  curl $HOST -X POST -H "Content-Type: application/json" -d '
    {
      "jsonrpc": "2.0",
      "id": 1,
      "method": "getTransaction",
      "params": [
        "$x"
        "json"
      ]
    }
  '
done
