@echo off

set kin1=145.40.68.91        & :: kin-validator-am6-1 / 31fxZovs3gBKVVTtC2VJUuKeVoq6mQkLjWnicWhErQ4f
set kin2=145.40.76.233       & :: kin-validator-da11-1 / Edfkf9gpC7KpnkNdKRPmseCtkE1zY8fUVRJMbiLYKKdK
set kin3=147.75.74.211       & :: kin-validator-ny5-1 / 2k31vk7hPiu2T9fJzuunc6tmaE57P7wt6tFoGK5A7k47
set kin4=145.40.117.153      & :: kin-validator-sg1-1 / 3cVWsRiTXD99BXNhzXs7Gkm3YBhCDrMQWnLern8B7TrD
set kin5=145.40.117.157      & :: kin-spare-sg1-1 / kin52jAhScxJHbs3j9YdBFupe24MMbZJeHFDrTh49Pg

:: gcp box (dead)
::set rpc1=34.148.201.98       & :: testnet-kin-rpc-bm-1 / 7JcmM6TFZMkcDkZe6RKVkGaWwN5dXciGC4fa3RxvqQc9
::set rpc2=34.139.158.147      & :: testnet-kin-rpc-bm-2 / AYJDiE3wgw5eanU4qJ4qfkB8vrHVEiBMTqXLbA9hUTaW

set bm_rpc1=147.75.100.131     & :: kin-rpc-am6-1 / 7JcmM6TFZMkcDkZe6RKVkGaWwN5dXciGC4fa3RxvqQc9
set bm_rpc2=139.178.85.7       & :: kin-rpc-da11-1 / AYJDiE3wgw5eanU4qJ4qfkB8vrHVEiBMTqXLbA9hUTaW

set client1=34.139.150.67    & :: testnet-kin-accounts-client-bm-1
set client2=34.148.56.23     & :: testnet-kin-accounts-client-bm-2                                    

set dev1=145.40.77.67       & :: dev-server-da11
set dev2=147.75.38.57       & :: dev-server-ny5
set dev3=139.178.94.233     & :: dev-server-sv15
set dev4=147.75.84.251      & :: dev-server-am6
set dev5=145.40.71.95       & :: dev-server-sg1
set dev6=139.178.86.41      & ::dev-server-us-da11-2	
set dev7=139.178.86.43      & ::dev-server-us-da11-3	 
set dev8=139.178.86.47      & ::dev-server-us-da11-4	
set dev9=139.178.84.77      & ::dev-server-us-da11-5	
set dev10=145.40.125.95     & ::dev-server-asia-hk2	
set dev11=145.40.73.123     & ::dev-server-asia-sg1-2	
set dev12=147.75.92.181     & ::dev-server-asia-ty11	
set dev13=147.75.101.141    & ::dev-server-eu-am6-2	
set dev14=145.40.117.159    & ::dev-server-asia-sg1-2	
set dev15=139.178.70.87     & ::dev-server-us-sv15-2	
set dev16=139.178.83.77     & ::dev-server-us-da11-6	
set dev17=139.178.83.237    & ::dev-server-us-da11-7	
set dev18=145.40.113.179    & ::dev-server-eu-ld7-1	
set dev19=139.178.83.107    & ::dev-server-us-da11-8	
set dev20=145.40.113.181    & :: dev-server-eu-ld7-2	

set mydev=216.202.208.198  &  ::dev-lumen-Atlanta-2-3

set hy1=147.28.146.231      & ::dev-equinix-washington-5 / 9ffnCrMEtWQPggdAoMLB15JUVN144m19s6NChwKpoitu
set hy2=86.109.7.117        & ::dev-equinix-washington-23 / 4WPtkxR3ThXX86vMP9TEZyVN52Bk3jZBKM5dxyqYv8Pe


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
set jw10=147.28.146.119       & :: jw1ogdyq72xfsfXH6w2kQWVSEzpgbD7DKfYT4PrAtcy
set jw11=147.28.146.5         & :: ??
set jw12=147.28.146.229       & :: jw12zWEKBVrKxHCfbkbFVk3veipsmzYxUnsTg5juwkB
set jw13=145.40.69.17         & :: jw13R1n5bVkqYSPHkWEmFEHp7PTiQYTaHb8yHaga4Wh
set jw14=147.28.151.75        & :: jw14KneJptEvYMLtJ1qy1k7fEgCcnVVyXn7AWbxQHzQ
