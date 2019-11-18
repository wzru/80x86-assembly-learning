dseg segment
    DATAX db 3
    DATAY db 3
    switch dw 2Ah dup(1111h),$mul,$add,1111h,$sub,1111h,$div
    printf db '0123456789ABCDEF'
dseg ends
cseg segment
        assume cs:cseg,ds:dseg
$add:   add al,bl
        jmp $display
$sub:   sub al,bl
        jmp $display
$mul:   mul bl
        jmp $display
$div:   div bl
        jmp $display
$display:
        mov ah,2
        push ax
        mov dl,' '
        int 21h
        pop ax
        mov bx,offset printf
        mov cl,al
        shr al,1
        shr al,1
        shr al,1
        shr al,1
        xlat
        mov dl,al
        int 21h
        mov al,cl
        and al,0fh
        xlat
        mov dl,al
        int 21h
        mov dl,'H'
        int 21h
        jmp $end
main:   mov ax,dseg
        mov ds,ax
        mov ah,1
        int 21h
        mov ah,0
        shl ax,1
        mov bp,ax
        mov si,offset switch
        mov di,ds:[bp+si]
        mov al,DATAX
        mov bl,DATAY
        jmp di
$end:
        mov ax,4c00h
        int 21h
cseg ends
end main