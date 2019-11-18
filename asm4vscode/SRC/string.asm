include base.asm
include math.asm
ifdef __string__
else
__string__ segment
    ;function list
    ;1.void strcpy (@buffer,@buffer)
    ;2.void strcat (@buffer,@buffer)
    ;3.bx strcmp (@buffer,@buffer)
    ;4.bx strlen (@buffer)
    ;5.void substr (@buffer,@buffer,@8,@8)

    ;1.void strcpy (@buffer,@buffer)
    ;copy second@buffer to first@buffer
    ;make sure first@buffer is enough
    ;if not enough will not copy And errorlevel=1

    ;2.void strcat (@buffer,@buffer)
    ;catenate second@buffer to first@buffer's tail
    ;make sure first@buffer is enough
    ;if not enough will not catenate And errorlevel=2

    ;3.bx strcmp (@buffer,@buffer)
    ;compare two buffer,bh=<:0ffffh,=:0,>:1

    ;4.bx strlen (@buffer)
    ;determine buffer's length,bx=length

    ;5.void strsub (@buffer,@buffer,@8,@8)
    ;copy second@buffer[@8,@8) into first@buffer
    ;make sure first@buffer is enough
    ;if not enough will not copy And errorlevel=5

    ;attention:if not enough,const number "errorlevel" will be assigned
    ;you can use d16 errorlevel after every str function if errorlevel
    ;isn't zero,meaning error occured

    strcpy equ callso2 _strcpy_,
    strcat equ callso2 _strcat_,
    strcmp equ callso2 _strcmp_,
    strlen equ callso _strlen_,
    strsub equ callso282 _strsub_,

    _strcpy_ proc far
        push ds
        push di
        push es
        push si

        loadparam 4,1,ax
        mov es,ax
        loadparam 4,3,ax
        mov ds,ax
        loadparam 4,2,di
        loadparam 4,4,si
        mov al,es:[di-2]
        mov ah,[si-1]
        cmp al,ah
        jae _strcpy_@ok
        errorlevel=1
        jmp _strcpy_@end
        _strcpy_@ok:
        cld
        push cx
        move cx,[si-1]
        rep movsb
        mov es:[di],0
        pop cx

        _strcpy_@end:
        pop si
        pop es
        pop di
        pop ds
        ret 8
    _strcpy_ endp
    _strcat_ proc far
        push ds
        push di
        push es
        push si

        loadparam 4,1,ax
        mov es,ax
        loadparam 4,3,ax
        mov ds,ax
        loadparam 4,2,di
        loadparam 4,4,si
        mov al,es:[di-2]    ;capacity
        mov ah,es:[di-1]    ;size
        sub al,ah           ;remain
        mov ah,[si-1]       ;need
        cmp al,ah
        jae _strcat_@ok
        errorlevel=2
        jmp _strcat_@end
        _strcat_@ok:
        cld
        push cx
        move cx,es:[si-1]
        add [di-1],cl
        move cx,[di-1]
        add di,cx
        move cx,es:[si-1]
        sub di,cx
        rep movsb
        mov es:[di],0
        pop cx

        _strcat_@end:
        pop si
        pop es
        pop di
        pop ds
        ret 8
    _strcat_ endp
    _strcmp_ proc far
        push ds
        push di
        push es
        push si
        
        loadparam 4,1,ax
        mov ds,ax
        loadparam 4,3,ax
        mov es,ax
        loadparam 4,2,si
        loadparam 4,4,di
        cld
        push cx
        mov bh,0
        max8 [si-1],es:[di-1]
        mov cx,bx
        repnz cmpsb
        ja _strcmp_@above
        jb _strcmp_@below
        mov bx,0
        jmp _strcmp_@end
        _strcmp_@above:
        mov bx,1
        jmp _strcmp_@end
        _strcmp_@below:
        mov bx,-1

        _strcmp_@end:
        pop cx
        pop si
        pop es
        pop di
        pop ds
        ret 8
    _strcmp_ endp
    _strlen_ proc far
        push di
        push ds

        loadparam 2,1,ax
        mov ds,ax
        loadparam 2,2,di
        mov bl,[di-1]
        mov bh,0

        pop ds
        pop di
        ret 4
    _strlen_ endp
    _strsub_ proc far
        push ds
        push di
        push es
        push si

        loadparam 4,1,ax
        mov es,ax
        loadparam 4,3,ax
        mov ds,ax
        loadparam 4,2,di
        loadparam 4,4,si
        loadparam 4,5,ax
        add si,ax
        push cx
        loadparam 5,6,cx
        cmp cl,[si-1]
        jbe _strsub_@ok
        errorlevel=5
        jmp _strsub_@end
        _strsub_@ok:
        sub cx,ax
        cld
        rep movsb

        _strsub_@end:
        pop cx
        pop si
        pop es
        pop di
        pop ds
        ret 12
    _strsub_ endp
__string__ ends
endif
ifdef hiahiahia
; ;;使用方法示范 todo 懒得写
; datas segment
;     
;     
;     
; datas ends
; code segment
;     assume cs:code,ds:datas
; main:
;     mov ax,datas
;     mov ds,ax
;     mov ax,4c00h
;     int 21h
; code ends
; end main
endif