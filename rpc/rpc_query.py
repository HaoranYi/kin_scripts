import os

HOST='https://api.mainnet-beta.solana.com'
L=[

'4FdZkX5KaqcZNuTZZKVRqw5zWtjth7A6dpvrQk5aTiVGfy3G7Csi2WdojixdVtF3vmDmN4g3t8qB95VdPUQMY3a7',
'SLwiDVYWw6zfRhz2w6SaEjbV8pF4hu9cDyFqAChzAD8Z6nMXV2or7HT7JubsDQJgss9S5z1UK9qf416AbwSB6sU',
'R2QDECsoNWLzdnsjDy5oL7h2ZKN5dGmuP7aVc4HytxktExjP9pLvqEmFgy1jV8C9PF2PtAWkv7V12khYiQJ1uVt',
'4dX54oJoPa8m3iEm3DGh5zZ3YhZhZ4WeKt8YwSyAPNt1EKwNRUbVFaKLDrrmNEsJY1b7ZdhE8pcvd9FjTpq3Kzdm',
'5XWREGU13zJkqJRpLSRUtqMrRWRPavVSb9Ca9KRz5LgVHQRB6HdDH5hkvzkhBDZ6Hb1qu4gA26H8JrTanVxchUXg',
'4rKkeTZwxyHMzqJEAU4fNxwwFSTMarGGDvxEw7FYzMjjQ7z6f1msKbb9LJKg81cNwtb492aS8mvCAYWSSzvM9fZL',
'48xcaQC2YRstTc936NUvNE7zUgYBLDYmFmsnh1Rr3YuekVEBJ8KHB4WTJfcJwUNqTr76FhRrn2JdfwFqxzqJ2Nh8',
'5MpjpfrrX8gYzVRM95awLsXHFh9tLSgmz7ehC1UdqQnweRftggdaidcz6Y5FXZbXN7Y6VusihKfuDMPdpCwBw3tc',
'3A2M3DrY3ivSgZVvjaqc3g6jqMSnmcpb4RxQYcD8YgqSJASf815tJ9s7TZ2i43t9VRwjJp5sY24p6exD5mEQCQeV',
'PxVTWo5FMezECAxQEQ1Ua2wvTyLgZEPsfESP3cEuxGqwLAF28wJZJRRWiiJhvJJ6d9kre9JmjhGL6e5hr3ftfkR',
'4E7YAJrzy6U2aEvLuuidHwsZHqSuBPSVfm5uAvSJ4HH3f595hJqedrSU62sNEMtjtgZLMzq9ckxvwgZ4w2NQyFC9',
'5vUBTqyZQhvaFayDWTBQU8orvJieQkV2qRz8eLNiUUgnGJhdzXkHiMN9uKLZZjoMEaqwdBTQspRhPzH1ZdoWHmNC',
'2Cucc4WecnnaS1VouWWM2gYjrQXunSthwhTMX3xmNwc51ZEoKF8XSV2osPEsCjMjxfa5QGvoo7LzfWSVg7KbNQcw',
'3n3iDdoTtBopvwVCyaFKKEvxwNfewUgQzzKvWzZFEhfB2hyfiA21W4vGJHw2A7htiLbzmMsZ3R73gUK34oqPNAEd',
'4jkjFRyvyBbTn3tP88S9iuEjVRKw1GLXVUZX8RJ9hZinKgnWC44GcvRk3KaMhetC5voD1iBK5hCFjvzJ8ah2tcwU',
'48CSThD5NMYnTVaNG78s5xmfXvKGzYMq3zG6LuDENX2mxdY6BdeqyoinRim8aaZZP6hmCSbWj2NidiEMshKqBfXD',
'4XYr8rMJJx5bAAAxQK9Z8rzGis7SGKNqUGhxFigkpSm5QhZa7AFnqkSRmDkLDe2o7UxuisRADNW5CXsiZxvw42Yj',
'4StzXfCVFbtYx4aDnR83jujPQ3NW5pLuZyzoGQBK4BzY9Mya6io4hU5g8AguSfyVGj5QhYCsbL5u9JYCYCQNGFHk',
'5PYwH5KCRoLCydzYpjAzuZHzX4m7s2jD1PPE7MyysMbrtbToZkF3MWNFypeDSCceTxsF2JRAbBE8pNXydfpPkJtZ',
'3g3ssLDBTo9sLpfFCKmHKj8ZhztiZqsWyJq6VsetLpBfdjiYrmg8DkydCfUpnJGdAttc3inspssfLqak1CuX3kRR',
  ]
  
cmd = '''
curl {} -X POST -H "Content-Type: application/json" -d '
    {{
      "jsonrpc": "2.0",
      "id": 1,
      "method": "getTransaction",
      "params": [
        "{}",
        "json"
      ]
    }}
' | jq    
''' 

for x in L: 
    #print(cmd.format(HOST, x))
    #print(x)
    os.system(cmd.format(HOST, x))

