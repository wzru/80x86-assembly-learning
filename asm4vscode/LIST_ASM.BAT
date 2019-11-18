@echo off
call set_path %2
call get_filename %1
if "%name_fail%" == "true" exit
echo 要得到%1的列表文件
masm %filename%,,list.lst|find /i "error">masm_error.txt
del *.obj
find /i "error" masm_error.txt>nul && goto masmerror || goto masmnoerror
:masmerror
    echo 汇编过程发生了错误,也可打开masm_error.txt查看
    echo 错误如下:
    find /i "error" masm_error.txt
    echo 请检查错误后按任意键确认
    pause>nul
    exit
:masmnoerror
    del masm_error.txt
