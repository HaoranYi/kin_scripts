#!/bin/bash 

jupyter nbconvert \
    --clear-output \
    --inplace \
    $1 
