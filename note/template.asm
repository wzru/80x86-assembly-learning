stack segment
    dw 512 dup(?)
stack ends

data segment
    string db 'Hello world!', 0dh, 0ah, '$'
data ends

code segment
    assume cs:code, ds:data, es:data, ss:stack

subname proc

    ret
subname endp

start:
    mov ax, data
    mov ds, ax

    mov ax, 4c00h
    int 21h

code ends
end start