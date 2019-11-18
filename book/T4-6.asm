data segment
    bufX db 1
    bufY db 2
    bufZ db ?
data ends

code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax
start:    
    mov al, bufX
    mov bl, bufY
    cmp al, bl
    jnb next
    xchg al, bl
next:
    mov bufZ, al
over:
    mov ax, 4c00h
    int 21h
code ends
end main