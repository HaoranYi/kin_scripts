from __future__ import print_function # Only Python 2.x
import subprocess

def execute(cmd, cmd2):
    popen = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
    print("haha1")
    popen2 = subprocess.Popen(cmd2, stdin=popen.stdout, stdout=subprocess.PIPE, universal_newlines=True)

    print("haha2", popen, popen2)
    for stdout_line in iter(popen2.stdout.readline, ""):
        yield stdout_line 
    print("haha3")
    popen.stdout.close()
    return_code = popen2.wait()
    if return_code:
        raise subprocess.CalledProcessError(return_code, cmd)

# Example
# '-F' in tail for retry, this will handle file move, i.e. log rotation
# The following example of tail -f | grep doesn't work because grep is waiting
# for the complete of tail -f to execute. But tail -f never finishes. So it
# stuck. In python the piped commands are not running in paralle. They run
# sequential. This is different from true bash shell pipe.

for path in execute(["tail", "test.txt"], ["grep", "aa"]):
    print(path, end="")




