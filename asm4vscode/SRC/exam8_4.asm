include stdio.asm
include display.asm
datas segment
    address dw 2ah dup(0),$mul,$add,0,$sub,0,$div
datas ends
codes segment
    assume cs:codes,ds:datas
$add:
    mov cx,ax
    get16
    add cx,ax
    xchg ax,cx
    jmp $end
$sub:
    mov cx,ax
    get16
    sub cx,ax
    xchg ax,cx
    jmp $end
$mul:
    mov cx,ax
    get16
    mul cx
    jmp $end
$div:
    mov cx,ax
    mov dx,0
    get16
    xchg ax,cx
    div cx
    jmp $end
$main:
    mov ax,datas
    mov ds,ax
    get16
    shl bx,1
    jmp address[bx]
$end:
    d16 ax
    putchar 0ah
    cmp bx,' '
    jz $main
    cmp bx,'='
    jz $main
    mov  ah,4ch
    int  21h
codes ends
end  $main