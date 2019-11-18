dseg segment
    prime db 2
    data db 60 dup(0)
    cnt dw 1
    sum dw 0
dseg ends
cseg segment
        assume cs:cseg,ds:dseg
main:   mov ax,dseg
        mov ds,ax
$init:  ;初始化
        mov bx,3
        mov si,offset data
$loop:  ;循环开始
        cmp bx,256
        jz $end
        mov ax,bx
        inc bx
        cmp bx,256
        jnz next
        nop
        next:
        call isprime
        cmp ah,0
        jnz $loop
        add sum,ax
        mov [si],al ;mov [si][cnt],al
        inc cnt
        inc si
        jmp $loop
$end:
        mov ax,4c00h
        int 21h
    ;入口参数 al=prime ah=0
    ;出口参数 ah=is? 0:是 1:不是
    isprime proc
        push cx
        push si
        mov cx,cnt
        mov si,offset prime
    $isprime?loop:
        push ax
        div byte ptr [si]
        inc si
        dec cx
        cmp ah,0
        pop ax
        jz $isprime?is
        jcxz $isprime?is
        jmp $isprime?loop
    $isprime?is:
        mov ah,0
        jnz $isprime?end
        mov ah,1
    $isprime?end:
        pop si
        pop cx
        ret
    isprime endp
cseg ends
end main