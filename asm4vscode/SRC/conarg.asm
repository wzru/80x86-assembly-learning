include base.asm
ifdef __conarg__
else
__conarg__ segment
    ;define list
    ;1.darg
    ;function list
    ;1.void loadarg(void)

    ;1.darg
    ;define arg data
    ;darg macro

    ;1.void loadarg(void)
    ;load data in es:80H into arg
    ;arg is asciiz
    ;loadarg macro

    loadarg equ call0 _loadarg_

    darg macro
        arg db 80h dup(0)
    endm
    _loadarg_ proc far
        push ax
        push cx
        push si
        push di
        xor cx,cx
        mov cl,es:[80h]
        dec cl
        mov si,82h
        mov di,offset arg
        _loadarg_@loadarg:
        mov al,es:[si]
        cmp al,' '
        jz _loadarg_@ok
        mov [di],al
        inc si
        inc di
        loop _loadarg_@loadarg
        _loadarg_@ok:
        pop di
        pop si
        pop cx
        pop ax
        ret
    _loadarg_ endp
__conarg__ ends
endif
ifdef hiahiahia
; ;;使用方法示范
; include stdio.asm
; datas segment
;     darg
; datas ends
; codes segment
;     assume cs:codes,ds:datas
; main:
;     mov ax,datas
;     mov ds,ax
;     loadarg
;     puts arg
;     mov ax,4c00h
;     int 21h
; codes ends
; end main
endif