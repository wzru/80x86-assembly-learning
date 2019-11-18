@echo off
set ConfigFile="%UserProfile%\AppData\Local\DOSBox\dosbox-0.74.conf"
copy /Y "%asm_path%\DOSBOX\DosBoxConfig.conf" %ConfigFile% > nul
echo mount C "%asm_path%\EXE" >> %ConfigFile%
echo C: >> %ConfigFile%
if "%~1" == "" goto run
echo %~1 >> %ConfigFile%
if "%~2" == "" goto run
echo %~2 >> %ConfigFile%
if "%~3" == "" goto run
echo %~3 >> %ConfigFile%
:run
start /w dosbox -noconsole
copy /Y "%asm_path%\DOSBOX\DosBoxConfig.conf" %ConfigFile% > nul
echo mount C "%asm_path%\EXE" >> %ConfigFile%
echo C: >> %ConfigFile%
del stderr.txt > nul
del stdout.txt > nul