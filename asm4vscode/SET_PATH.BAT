@echo off
if "%include_set_path%" == "true" goto :eof
set include_set_path=true
set path=%path%;%cd%;%cd%\MASM;%cd%\DOSBOX;%cd%\EXE;
set asm_path=%cd%
if "%1" == "0" cd SRC
if "%1" == "1" cd PROBLEM