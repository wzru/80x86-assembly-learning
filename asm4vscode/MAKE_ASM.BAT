@echo off
call set_path %2
call get_filename %1
if "%name_fail%" == "true" exit
echo Ҫ����%1
masm %filename%;|find /i "error">masm_error.txt
find /i "error" masm_error.txt >nul && goto masmerror || goto masmnoerror
:masmerror
    echo �����̷����˴���,Ҳ�ɴ�masm_error.txt�鿴
    echo ��������:
    find /i "error" masm_error.txt
    echo �������������ȷ��
::    pause>nul
    exit
:masmnoerror
    del masm_error.txt
::masm---------------------------------------------------------------------------
link %filename%;|find /i "error" > link_error.txt
find /i "error" link_error.txt >nul && goto linkerror || goto linknoerror
:linkerror
    echo ���ӹ��̷����˴���,Ҳ�ɴ�link_error.txt�鿴
    echo ��������:
    find /i "error" link_error.txt
::    pause
    exit
:linknoerror
    del link_error.txt
    del *.obj
::link---------------------------------------------------------------------------
move /Y "%filename%.exe" "%asm_path%\EXE\%filename%.exe">nul
::move-exe-----------------------------------------------------------------------
echo ����ɹ�%1