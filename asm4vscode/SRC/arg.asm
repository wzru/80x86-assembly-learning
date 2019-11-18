include stdio.asm
include display.asm
codes  segment
main:
    mov al,es:[80h]
    mov ah,0
    add ax,81h
    mov si,ax
    mov es:[si],0

    mov si,80h
    xor ax,ax
    cld
_loop:
    lodsb
    cmp ax,0
    jz _end
    push ax
    call d8bh
    putchar ' '
    jmp _loop
_end:
    mov  ah,4ch
    int  21h
codes  ends
end  main