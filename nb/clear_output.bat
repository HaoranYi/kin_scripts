@echo off

jupyter nbconvert --ClearOutputPreprocessor.enabled=True --clear-output %1 
