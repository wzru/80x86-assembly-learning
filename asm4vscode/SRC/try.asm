datas segment
datas ends
print_num macro num
    push ax
    push bx
    push cx
    push dx
    mov al,num
    call ?print_num
    pop dx
    pop cx
    pop bx
    pop ax
    endm

code segment
    ?print_num proc far
        mov bl,al
        shr al,1
        shr al,1
        shr al,1
        shr al,1
        or al,30h
        mov dl,al
        mov ah,2
        int 21h
        mov al,bl
        and al,0fh
        or al,30h
        mov dl,al
        mov ah,2
        int 21h
        ret
    ?print_num endp
code ends

codes segment
    assume cs:codes,ds:datas
main:
    mov dx,0c0ch
    mov bh,0
    mov ah,2
    int 10h
    mov ah,2
    int 1ah
    print_num ch
    mov ah,2
    mov dl,':'
    int 21h
    print_num cl
    mov ah,2
    mov dl,':'
    int 21h
    print_num dh
    jmp main

    mov ah,4ch
    int 21h
codes ends
end main
