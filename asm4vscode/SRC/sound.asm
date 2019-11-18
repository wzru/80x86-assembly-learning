data segment
    time dw 100
    freq dw 100
    f dw ?
    t dw ?
data ends
print_num macro num
    push ax
    push bx
    push cx
    push dx
    mov ax,num
    call ?print_num
    crlf
    pop dx
    pop cx
    pop bx
    pop ax
    endm
crlf macro
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    endm
code segment
    assume cs:code,ds:data
    main:
    mov ax,data
    mov ds,ax
    mov cx,99
    deep:
    call sound
    loop deep
    mov ah,4ch
    int 21h
    sound proc far
        push cx
        mov ax,freq
        mov dx,time
        mov f,ax
        add freq,100
        dec time
        in al,61h
        and al,11111100b
        trig:
        xor al,00000010b
        out 61h,al
        mov cx,f
        delay:
        loop delay
        dec dx
        jne trig
        pop cx
        ret
    sound endp
    ?print_num proc far
        ;while(x)
        ;   putchar(x%10),x/=10;
        mov bx,10
        xor cx,cx
        ??zero?:
        xor dx,dx
        div bx
        or dl,30h
        push dx
        inc cx
        cmp ax,0
        jnz ??zero?
        mov ah,2
        ??end:
        pop dx
        int 21h
        loop ??end
        ret
    ?print_num endp
code ends
end main