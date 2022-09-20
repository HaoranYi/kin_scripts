@echo off

jupyter nbconvert ^
    --clear-output ^
    --inplace ^
    %1 
