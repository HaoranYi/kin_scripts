import os
import sys

from concurrent.futures import ThreadPoolExecutor

DIR1 = '{0}/accounts'.format(sys.argv[1]) #268484163-old/accounts/
DIR2 = '{0}/accounts'.format(sys.argv[2]) #268484163-new/accounts/

f1 = os.listdir(DIR1)
f2 = os.listdir(DIR2)

print('num_files {} {}', len(f1), len(f2))

print('build old files map ...')
s1 = dict()
for x in f1:
    k = x.split('.')[0]
    s1[k] = x

print('build new files map ...')
s2 = dict()
for x in f2:
    k = x.split('.')[0]
    s2[k] = x

print('compare files ...')
success = True


def compare(f1, f2):
    success = True
    cmd = 'sudo diff {2}/{0} {3}/{1}'.format(f1, f2, DIR1, DIR2)
    ret = os.system(cmd)
    if ret > 0: 
        success = False
        print('found diff in ', cmd)
    return success


with ThreadPoolExecutor() as executor: 
    jobs = []
    for k in s1:
        f1 = s1[k]
        if k not in s2:
            print(k, 'not found in new')
            success = False
            continue
        f2 = s2[k]
        jobs.append(executor.submit(compare, f1, f2))
    for job in jobs:
        r = job.result()
        if not r:
            success = False


for k in s2:
    if k not in s1:
        success = False
        print(k, 'not found in old')

if success:
    print('account files compare SUCESS!\n')
else:
    print('account files compare FAIL!\n')


