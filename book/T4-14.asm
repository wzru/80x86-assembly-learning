include io.inc

N equ 20

data segment
    arrayM db 1 2 3 4 5 6 7 8 9 10 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1
    arrayP db 20 dup(?)
    arrayN db 20 dup(?)
data ends

code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax
start:    
    mov cx, N
    xor bx, bx
    xor si, si
    iterator:
        mov ax, arrayM[si]
        cmp ax, 0
        jl negtive
        mov arrayP[bh], arrayM[si]
        inc bh
        jmp next
        negtive:
            mov arrayN[bl], arrayM[si]
            inc bl
        next:
            inc si
    loop iterator
    mov al, bh
    call dispuib;输出正数个数
    mov al, bl
    call dispuib;输出负数个数
over:
    mov ax, 4c00h
    int 21h
code ends
end main