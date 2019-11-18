include stdio.asm
include file.asm
include conarg.asm
include display.asm
datas segment
    darg
    dfile fp,'param_file'
    dbuffer input,40h
datas ends
codes segment
    assume cs:codes,ds:datas
    ferror fp,$end
$main:
    mov ax,datas
    mov ds,ax
    loadarg
    mov di,offset arg
    fopen fp,di,r
$get:
    fgets fp,input
    cmp ax,0
    jz $putok
    put input
    jmp $get
$putok:
    fclose fp
$end:
    mov  ah,4ch
    int  21h
codes ends
end  $main