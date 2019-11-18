@echo off
cd ..
call set_path
call get_filename %1
if "%name_fail%" == "true" exit
call run_dosbox "debug %filename%.exe"