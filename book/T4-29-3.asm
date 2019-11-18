data segment use16
    number equ 3A4Eh
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
    call hex
over:
    mov dx, offset string
    mov ax, 0900h
    int 21h
    mov ax, 4c00h
    int 21h

hex proc;依次取4位, 总共取4次
    mov bx, dx
    mov ax, number
    mov cl, 12
    shr ax, cl
    call put

    mov ax, number
    and ax, 0F00h
    mov cl, 8
    shr ax, cl
    call put

    mov ax, number
    and ax, 00F0h
    mov cl, 4
    shr ax, cl
    call put

    mov ax, number
    and ax, 000Fh
    call put
    ret
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