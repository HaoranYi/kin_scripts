#!/usr/bin/env python

import subprocess
import time
import re

last = 0
pattern = '.*slot: (\d+),.*, bank hash: (.*)$'

f = open('bank_hash.txt', 'a')
while True:
    proc = subprocess.Popen(['grep', "slot: .*bank hash:", "logs/solana-validator.log"],stdout=subprocess.PIPE)
    while True:
        line = proc.stdout.readline()
        if not line: break
        m = re.search(pattern, s)
        slot = int(m.group(1))
        bank_hash = m.group(2)

        if slot >= last:
            print line
            f.write(line)
            f.write('{} {}'.format(slot, bank_hash))
            f.flush()
            last = slot
    time.sleep(60)

f.close()

