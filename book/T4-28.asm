data segment
    string db 'I love Assembly Language.', 10, 13, '$'
data ends

code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax
start:    
    mov al, 2
    lea bx, string
iterator:
    mov ah, [bx]
    cmp al, 0
    je to_lower
    cmp al, 1
    je to_upper
    call proc_to_exchange
    jmp next
to_lower:
    call proc_to_lower
    jmp next
to_upper:
    call proc_to_upper
next:
    inc bx
    jmp iterator
over:
    mov dx, offset string
    mov ah, 09h
    int 21h
    mov ax, 4c00h
    int 21h

proc_to_lower proc
    or ah, ah
    jz over
    cmp ah, 'A'
    jb next
    cmp ah, 'Z'
    ja next
    xor ah, 20h
    mov [bx], ah
    ret
proc_to_lower endp

proc_to_upper proc
    or ah, ah
    jz over
    cmp ah, 'a'
    jb next
    cmp ah, 'z'
    ja next
    xor ah, 20h
    mov [bx], ah
    ret
proc_to_upper endp

proc_to_exchange proc
    or ah, ah
    jz over
    cmp ah, 'A'
    jb lower
    cmp ah, 'Z'
    jna ok
lower:
    cmp ah, 'a'
    jb next
    cmp ah, 'z'
    ja next
ok:
    xor ah, 20h
    mov [bx], ah
    ret
proc_to_exchange endp

code ends
end main