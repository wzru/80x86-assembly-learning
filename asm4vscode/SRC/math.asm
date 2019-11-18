include base.asm
ifdef __math__
else
__math__ segment
    ;define list
    ;
    ;function list
    ;1.bl min8(@8,@8)
    ;2.bh max8(@8,@8)
    ;3.bx min16(@16,@16)
    ;4.bx max16(@16,@16)

    ;1.bl min8(@8,@8)
    ;bl=min(@8,@8)

    ;2.bh max8(@8,@8)
    ;bh=max(@8,@8)

    ;3.bx min16(@16,@16)
    ;bx=min(@16,@16)

    ;4.bx max16(@16,@16)
    ;bx=max(@16,@16)

    ;这里的函数均不保护bx&F寄存器
    ;哪怕返回值是bl,bh也会被改变
    ;attention!

    min8 equ call82 _min8_,
    max8 equ call82 _max8_,
    min16 equ call2 _min16_,
    max16 equ call2 _max16_,

    _min8_ proc far
        loadparam 0,1,ax
        loadparam 0,2,bx
        cmp ax,bx
        jae _min8_@end
        mov bx,ax
        _min8_@end:
        ret 4
    _min8_ endp
    _max8_ proc far
        loadparam 0,1,ax
        loadparam 0,2,bx
        cmp bx,ax
        jae _max8_@end
        mov bx,ax
        _max8_@end:
        ret 4
    _max8_ endp
    _min16_ proc far
        loadparam 0,1,ax
        loadparam 0,2,bx
        cmp ax,bx
        jae _min16_@end
        mov bx,ax
        _min16_@end:
        ret 4
    _min16_ endp
    _max16_ proc far
        loadparam 0,1,ax
        loadparam 0,2,bx
        cmp bx,ax
        jae _max16_@end
        mov bx,ax
        _max16_@end:
        ret 4
    _max16_ endp
__math__ ends
endif
ifdef hiahiahia
; ;;使用方法示范
; datas segment
;     $tr db 'asdjiozxc$'
;     str db 'aoxpiawp',0
;     dbuffer input,7fh
; datas ends
; code segment
;     assume cs:code,ds:datas
; main:
;     mov ax,datas
;     mov ds,ax
;     putchar 'a'
;     putchar 0ah
;     mov ax,'S'
;     putchar ax
;     putchar 0ah
;     put$ $tr
;     putchar 0ah
;     puts str
;     putchar 0ah
;     gets input
;     putchar 0ah
;     put input
;     mov ax,4c00h
;     int 21h
; code ends
; end main
endif