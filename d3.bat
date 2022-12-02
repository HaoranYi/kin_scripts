FOR /F "tokens=* USEBACKQ" %%F IN (`command`) DO (
SET var=%%F
)
ECHO %var%
