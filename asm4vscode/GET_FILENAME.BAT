@echo off
if "%include_get_filename%" == "true" goto :eof
set include_get_filename=true
set filepath=%1
set filepath=%filepath:\"=%
set filepath=%filepath:"=%
::get-pure-path------------------------------------------------------------------
if not defined filepath (echo 必须有参数&pause&exit)
::judge-filepath-----------------------------------------------------------------
set filename= 
:no2
if not "%filepath:~-1%" equ "\" (
     set filename=%filepath:~-1%%filename%&set filepath=%filepath:~0,-1%&goto no2
)
set filename=%filename:~0,-5%
set name=%filename%
::-----------strlen <=8
set num=0
:judge
if "%name%" equ "" goto strlenend
set name=%name:~0,-1%
set /a num=num+1
goto judge
:strlenend
if %num% leq 8 goto strlenend
::-----------strlen
set name_fail=true
echo 错误:文件名超过8位
:strlenend
set name_fail=false