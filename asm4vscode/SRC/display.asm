include base.asm
ifdef __display__
else
__display__ segment
    ;define list
    ;nop
    ;function list
    ;1.void h16 (@16)
    ;2.void h8 (@16)
    ;3.void h4 (@16)
    ;4.void d16 (@16)

    ;1.h16 @16
    ;display @16 by 4%x

    ;2.h8 @16
    ;display @16's low 8 bits by 2%x

    ;3.h4 @16
    ;display @16's low 4 bits by %x

    ;4.d16 @16
    ;display @16 by %d

    h16 equ call1 _h16_,
    h8 equ call1 _h8_,
    h4 equ call1 _h4_,
    d16 equ call1 _d16_,

    _h16_ proc far
        push bx
        push dx

        loadparam 2,1,ax
        mov bl,ah
        h8 bx
        h8 ax

        pop dx
        pop bx
        ret 2
    _h16_ endp
    _h8_ proc far
        push bx
        push dx

        loadparam 2,1,ax
        mov bl,al
        shr al,1
        shr al,1
        shr al,1
        shr al,1
        h4 ax
        h4 bx

        pop dx
        pop bx
        ret 2
    _h8_ endp
    _h4_ proc far
        push dx

        loadparam 1,1,ax
        and ax,000fh
        mov ah,2
        cmp al,10
        jb _h4_@num
        add al,7
        _h4_@num:
        add al,30h
        mov dl,al
        int 21h

        pop dx
        ret 2
    _h4_ endp
    _d16_ proc far
        push bx
        push cx
        push dx

        loadparam 3,1,ax
        mov bx,10
        xor cx,cx
        _d16_@loop:
        cmp ax,0
        jz _d16_@put
        xor dx,dx
        div bx
        push dx
        inc cx
        jmp _d16_@loop
        _d16_@put:
        jcxz _d16_@end
        call _h4_
        dec cx
        jmp _d16_@put
        _d16_@end:

        pop dx
        pop cx
        pop bx
        ret 2
    _d16_ endp
__display__ ends
endif
ifdef hiahiahiahiahia
; ;;使用方法示范
; include stdio.asm
; code segment
;     assume cs:code
; main:
;     h4 0
;     putchar 0ah
;     h4 15
;     putchar 0ah
;     h8 0
;     putchar 0ah
;     h8 15
;     putchar 0ah
;     h8 255
;     putchar 0ah
;     h16 0
;     putchar 0ah
;     h16 15
;     putchar 0ah
;     h16 255
;     putchar 0ah
;     h16 4095
;     putchar 0ah
;     h16 -1
;     putchar 0ah
;     d16 1
;     putchar 0ah
;     d16 12
;     putchar 0ah
;     d16 123
;     putchar 0ah
;     d16 1234
;     putchar 0ah
;     d16 12345
;     putchar 0ah
;     mov ax,4c00h
;     d16 ax
;     putchar 0ah
;     h16 ax
;     int 21h
; code ends
; end main
endif