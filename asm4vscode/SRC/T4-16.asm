data segment
    msg1 db 'There is DEBUG in this area!', 10, 13, '$'    
    msg2 db 'There is NO DEBUG in this area!', 10, 13, '$'
data ends

code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax
start:    
    mov ax, 0070h
    mov ds, ax
    xor si, si
    mov cx, 1024
    iterator:
        cmp [si], 'D'
            jne next
        inc si
        cmp [si], 'E'
            jne next
        inc si
        cmp [si], 'B'
            jne next
        inc si
        cmp [si], 'U'
            jne next
        inc si
        cmp [si], 'G'
            je found
    next:
        inc si
    loop iterator
not_found:
    mov dx, offset msg2
    jmp print
found:
    mov dx, offset msg1
print:
    mov ah, 09h
    int 21h
over:
    mov ax, 4c00h
    int 21h
code ends
end main