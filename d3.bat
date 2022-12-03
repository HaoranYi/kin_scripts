@echo off

:: example to run a command and save the result into variables


FOR /F "tokens=* USEBACKQ" %%F IN (`echo abc`) DO (
SET var=%%F
)
ECHO %var%


SETLOCAL ENABLEDELAYEDEXPANSION
SET count=1
FOR /F "tokens=* USEBACKQ" %%F IN (`dir .`) DO (
  SET var!count!=%%F
  SET /a count=!count!+1
)
ECHO %var1%
ECHO %var2%
ECHO %var3%
ENDLOCAL
