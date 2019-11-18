@echo off
set /p=new asm filename:<nul
set /p fname=
set name=%fname%
for %%i in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do call set name=%%name:%%i=%%i%%
if "%name%" equ "debug" goto error_debug
set name=%fname%
::-----------strlen <=8
set num=0
:judge
if "%name%" equ "" goto strlenend
set name=%name:~0,-1%
set /a num=num+1
goto judge
:strlenend
if %num% gtr 8 goto nope
::-----------strlen
cd SRC
set fname=%fname%.asm
echo;datas segment>%fname%
echo;    string DB 'Hello World!',13,10,'$'>>%fname%
echo;datas ends>>%fname%
echo;>>%fname%
echo;codes segment>>%fname%
echo;    assume cs:codes,ds:datas>>%fname%
echo;main:>>%fname%
echo;    mov ax,datas>>%fname%
echo;    mov ds,ax>>%fname%
echo;>>%fname%
echo;    lea dx,string>>%fname%
echo;    mov ah,09h>>%fname%
echo;    int 21h>>%fname%
echo;>>%fname%
echo;    mov ah,4ch>>%fname%
echo;    int 21h>>%fname%
echo;codes ends>>%fname%
echo;end main>>%fname%
echo 创建%fname%.asm成功
goto :eof
:nope
echo 创建%fname%.asm失败,原因:文件名字超过8位
pause
goto :eof
:error_debug
echo 创建%fname%.asm失败,原因:文件名字不能为%fname%,会把DEBUG.EXE覆盖的!
pause
goto :eof