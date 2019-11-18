@echo off
call set_path %2
call get_filename %1
if "%name_fail%" == "true" exit
echo 要编译%1
masm %filename%;|find /i "error">masm_error.txt
find /i "error" masm_error.txt >nul && goto masmerror || goto masmnoerror
:masmerror
    echo 汇编过程发生了错误,也可打开masm_error.txt查看
    echo 错误如下:
    find /i "error" masm_error.txt
    echo 请检查错误后按任意键确认
::    pause>nul
    exit
:masmnoerror
    del masm_error.txt
::masm---------------------------------------------------------------------------
link %filename%;|find /i "error" > link_error.txt
find /i "error" link_error.txt >nul && goto linkerror || goto linknoerror
:linkerror
    echo 连接过程发生了错误,也可打开link_error.txt查看
    echo 错误如下:
    find /i "error" link_error.txt
::    pause
    exit
:linknoerror
    del link_error.txt
    del *.obj
::link---------------------------------------------------------------------------
move /Y "%filename%.exe" "%asm_path%\EXE\%filename%.exe">nul
::move-exe-----------------------------------------------------------------------
echo 编译成功%1