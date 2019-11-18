@echo off
call set_path %2
call get_filename %1
if "%name_fail%" == "true" exit
call make_asm %1
call run_dosbox "%filename%.exe"