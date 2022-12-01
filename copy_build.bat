@echo on

REM call expand the variable in the argument
call set target=%1%

pscp "sol@%kin1%:/home/sol/stage/bin/solana-validator" .
pscp solana-validator "sol@%target%:/home/sol/"
plink -batch sol@%target% "chmod u+x ~/solana-validator"

