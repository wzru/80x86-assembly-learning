include stdio.asm
include file.asm
include conarg.asm
include display.asm
include string.asm
datas segment
    m equ this dword
    main dw offset $main,seg $main
    darg
    dbuffer input,15
    dbuffer output,15
datas ends
css segment
@main:
    jmp far ptr $main
css ends
codes segment
    assume cs:codes,ds:datas
$main:
    mov ax,datas
    mov ds,ax
    ;jmp end$
    gets input
    putchar 0ah
    gets output
    putchar 0ah
    strcat output,input
    d16 bx
    putchar 0ah
    jmp $main
$end:
    mov  ah,4ch
    int  21h
codes ends
end  $main