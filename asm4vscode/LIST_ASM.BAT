@echo off
call set_path %2
call get_filename %1
if "%name_fail%" == "true" exit
echo Ҫ�õ�%1���б��ļ�
masm %filename%,,list.lst|find /i "error">masm_error.txt
del *.obj
find /i "error" masm_error.txt>nul && goto masmerror || goto masmnoerror
:masmerror
    echo �����̷����˴���,Ҳ�ɴ�masm_error.txt�鿴
    echo ��������:
    find /i "error" masm_error.txt
    echo �������������ȷ��
    pause>nul
    exit
:masmnoerror
    del masm_error.txt