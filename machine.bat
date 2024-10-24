@echo off

set kin1=145.40.68.91        & :: kin-validator-am6-1 / 31fxZovs3gBKVVTtC2VJUuKeVoq6mQkLjWnicWhErQ4f
set kin2=145.40.76.233       & :: kin-validator-da11-1 / Edfkf9gpC7KpnkNdKRPmseCtkE1zY8fUVRJMbiLYKKdK
set kin3=147.75.74.211       & :: kin-validator-ny5-1 / 2k31vk7hPiu2T9fJzuunc6tmaE57P7wt6tFoGK5A7k47
set kin4=145.40.117.153      & :: kin-validator-sg1-1 / 3cVWsRiTXD99BXNhzXs7Gkm3YBhCDrMQWnLern8B7TrD
set kin5=145.40.117.157      & :: kin-spare-sg1-1 / kin52jAhScxJHbs3j9YdBFupe24MMbZJeHFDrTh49Pg

set new_kin1=147.28.156.19
set new_kin2=147.28.156.37
set new_kin3=147.28.156.187
set new_kin4=147.28.156.83
set new_kin5=147.28.156.113
set new_kin6=145.40.126.165


:: gcp box (dead)
::set rpc1=34.148.201.98       & :: testnet-kin-rpc-bm-1 / 7JcmM6TFZMkcDkZe6RKVkGaWwN5dXciGC4fa3RxvqQc9
::set rpc2=34.139.158.147      & :: testnet-kin-rpc-bm-2 / AYJDiE3wgw5eanU4qJ4qfkB8vrHVEiBMTqXLbA9hUTaW

set bm_rpc1=147.75.100.131     & :: kin-rpc-am6-1 / 7JcmM6TFZMkcDkZe6RKVkGaWwN5dXciGC4fa3RxvqQc9
set bm_rpc2=139.178.85.7       & :: kin-rpc-da11-1 / AYJDiE3wgw5eanU4qJ4qfkB8vrHVEiBMTqXLbA9hUTaW

set client1=34.139.150.67    & :: testnet-kin-accounts-client-bm-1
set client2=34.148.56.23     & :: testnet-kin-accounts-client-bm-2                                    

set hy1=139.178.67.25        & ::haoran-dev-ny
set hy2=147.28.133.107       & ::haoran-dev-paris-1
set hy3=147.28.156.191       & ::haron-dev-sg
set hy4=145.40.126.135       & ::haoran-dev-hk-1

:: devnet
set dv1=145.40.71.85 & :: devnet-validator-asia-sg1 / dv1ZAGvdsz5hHLwWXsVnM94hWf1pjbKVau1QVkaMJ92
set dv2=136.144.49.15 & :: devnet-validator-europe-fr2 / dv2eQHeP4RFrJZ6UeiZWoc3XTtmtZCUKxxCApCDcRNV
set dv3=147.75.55.147 & :: devnet-validator-us-da11 / dv3qDFk1DTF36Z62bNvrCXe9sKATA6xvVy6A798xxAS
set dv4=147.75.105.51 & :: devnet-validator-us-ny5 / dv4ACNkpYPcE3aKmYDqZm9G5EB3J4MRoeE7WNDRBVJB

:: popnet
set pn1=145.40.77.121         & ::pop-net-da11-1 / 31fxZovs3gBKVVTtC2VJUuKeVoq6mQkLjWnicWhErQ4f
set pn2=86.109.11.95          & ::pop-net-sv15-1 / Edfkf9gpC7KpnkNdKRPmseCtkE1zY8fUVRJMbiLYKKdK
set pn3=139.178.91.63         & ::pop-net-sv15-2 / 2k31vk7hPiu2T9fJzuunc6tmaE57P7wt6tFoGK5A7k47
set pn4=139.178.91.67         & ::pop-net-sv15-3 / 3cVWsRiTXD99BXNhzXs7Gkm3YBhCDrMQWnLern8B7TrD
set pn_rpc1=139.178.91.219    & ::pop-net-sv15-4 / 7JcmM6TFZMkcDkZe6RKVkGaWwN5dXciGC4fa3RxvqQc9
set pn_rpc2=147.75.71.91      & ::pop-net-sv15-5 / AYJDiE3wgw5eanU4qJ4qfkB8vrHVEiBMTqXLbA9hUTaW

set pn_client1=139.178.91.219 & ::pop-net-sv15-4
set pn_client2=147.75.71.91   & ::pop-net-sv15-5

:: jwash
set jw10=147.28.180.143       & :: jw1ogdyq72xfsfXH6w2kQWVSEzpgbD7DKfYT4PrAtcy
set jw11=147.75.198.191       & :: ??
set jw12=145.40.82.115        & :: jw12zWEKBVrKxHCfbkbFVk3veipsmzYxUnsTg5juwkB
set jw13=147.75.90.239        & :: jw13R1n5bVkqYSPHkWEmFEHp7PTiQYTaHb8yHaga4Wh
set jw14=145.40.82.7          & :: jw14KneJptEvYMLtJ1qy1k7fEgCcnVVyXn7AWbxQHzQ

:: dev
set dev4=147.28.178.9        & :: debug hash mismatch
set dev5=145.40.114.115      & :: CTzTRqfUaNz6yZFUJVMwcccUaH8AtWYpbRZsPkxy3zUe 
set dev7=147.28.198.63       & :: shared-dev-osa-3/6o3TZZodHRKzuRs1tAKvMVKqw5ZTmnGoynukN2bsfbLS (evict multi disk index entry PR3184) 
set dev8=147.75.87.223	     & :: shared-dev-am-7/FW3wKzRL8RHK37iGZ7jHTBy2CDTVGqKRYQpCQQDEHtFU   (file-io)
set dev9=147.75.87.221       & :: shared-dev-am-15/8bAgyWFMxMkZcLV2K2Nt5nn2DXmQQ9TRhER3xXsem6RM  (master:mmap)
set dev12=86.109.5.45        & :: shared-dev-fra-5/3gB7ELE9QhrQ4yKAsEegfNPXJsegUAmYuvbx1tKficih  (clean optimization - #2879)
