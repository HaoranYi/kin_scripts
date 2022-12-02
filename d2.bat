@echo on
setlocal enabledelayedexpansion 
set topic[0]=kin1
set topic[1]=kin2

for /l %%n in (0,1,1) do ( 
   echo !topic[%%n]! 
   call set "x=%kin1%"
   echo !x!
)
