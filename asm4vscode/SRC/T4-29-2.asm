data segment
    string db 'TEMP', 10, 13, '$'
data ends

stack segment
    dw 256 dup(0)
stack ends

code segment
    assume cs:code, ss:stack, ds:data
main:
    mov ax, data
    mov ds, ax
    mov si, 0
    mov dx, offset string;我也不知道为什么这里加了一句就可以正常输出了
start:    
    mov ax, 1A3Bh
    push ax
    call hex
over:
    mov dx, offset string
    mov ax, 0900h
    int 21h
    mov ax, 4c00h
    int 21h

hex proc;依次取4位, 总共取4次
    push bp
    mov bp, sp
    mov bx, dx
    mov ax, 4[bp];为什么bp[4]不行?
    push ax
    push ax
    push ax
    mov cl, 12
    shr ax, cl
    call put

    pop ax
    and ax, 0F00h
    mov cl, 8
    shr ax, cl
    call put

    pop ax
    and ax, 00F0h
    mov cl, 4
    shr ax, cl
    call put

    pop ax
    and ax, 000Fh
    call put
    mov sp, bp
    pop bp
    ret 3
hex endp

put proc
    cmp ax, 10
    jnb letter
    digit:
        add ax, 48
        jmp next
    letter:
        add ax, 55
next:
    mov [bx], ax
    inc bx
    ret
put endp

code ends
end main