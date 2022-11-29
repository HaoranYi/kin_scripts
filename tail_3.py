from __future__ import print_function # Only Python 2.x
import subprocess

def execute(cmd):
    popen = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True, shell=True)
    for stdout_line in iter(popen.stdout.readline, ""):
        yield stdout_line 
    popen.stdout.close()
    return_code = popen.wait()
    if return_code:
        raise subprocess.CalledProcessError(return_code, cmd)

# Example
# '-F' in tail for retry, this will handle file move, i.e. log rotation
#for path in execute("tail -F test.txt | grep aa"):  # not working when pass -F
for path in execute("tail -F test.txt"):
    print(path, end="")
    if 'aa' in path:
        print('found aa')




