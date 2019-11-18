include base.asm
ifdef __stdio__
else
__stdio__ segment
    ;define list
    ;1.dbuffer identifier,size,init=0
    ;function list
    ;1.void putchar (@r16/@i)
    ;2.void put$ (@$tr)
    ;3.void puts (@asciiz)
    ;4.void put (@buffer)
    ;5.void gets (@buffer)
    ;6.ax getch (void)

    ;1.dbuffer buffer,size,init=0
    ;buffer is name of buffer,size is size of buffer
    ;init is first content in the buffer,default is 0
    ;dbuffer macro buffer,size,init:=<0>

    ;1.void putchar (@r16/@i)
    ;display low 8 bits %c

    ;2.void put$ (@$tr)
    ;display %$

    ;3.void puts (@asciiz)
    ;display %s

    ;4.void put (@buffer)
    ;display buffer content

    ;5.void gets (@buffer)
    ;read from keyboard,content into buffer

    ;6.ax getch (void)
    ;ax=ascii
    ;getch macro

    putchar equ call1 _putchar_,
    put$ equ callso _put$_,
    puts equ callso _puts_,
    put equ callso _put_,
    gets equ callso _gets_,

    _putchar_ proc far
        push dx
        push ax
        push bp

        push sp
        pop bp
        mov dl,[bp+3*2+4]
        mov ah,2
        int 21h

        pop bp
        pop ax
        pop dx
        ret 2
    _putchar_ endp
    _put$_ proc far
        push ds
        push dx
        push ax
        push bp

        push sp
        pop bp
        mov ax,[bp+4*2+4]
        mov ds,ax
        mov dx,[bp+5*2+4]
        mov ah,9
        int 21h

        pop bp
        pop ax
        pop dx
        pop ds
        ret 4
    _put$_ endp
    _puts_ proc far
        push ds
        push si
        push ax
        push bp

        push sp
        pop bp
        mov ax,[bp+4*2+4]
        mov ds,ax
        mov si,[bp+5*2+4]
        mov ah,2
        cld
        _puts_$loop:
        lodsb
        cmp al,0
        jz _puts_$end
        mov dl,al
        int 21h
        jmp _puts_$loop

        _puts_$end:
        pop bp
        pop ax
        pop si
        pop ds
        ret 4
    _puts_ endp
    _put_ proc far
        push ds
        push si
        push ax
        push bp

        push sp
        pop bp
        mov ax,[bp+4*2+4]
        mov ds,ax
        mov si,[bp+5*2+4]
        dec si
        xor cx,cx
        mov cl,[si]
        inc si
        mov ah,2
        cld
        jcxz _put_$end
        _put_$loop:
        lodsb
        dec cx
        mov dl,al
        int 21h
        jz _put_$end
        jmp _put_$loop

        _put_$end:
        pop bp
        pop ax
        pop si
        pop ds
        ret 4
    _put_ endp
    getch macro
        mov ah,1
        int 21h
        mov ah,0
    endm
    dbuffer macro buffer,size,init:=<0>
        pre_&buffer db size,0
        &buffer db size dup(init),0
    endm
    _gets_ proc far
        push ax
        push dx
        push ds
        push si
        push bp

        push sp
        pop bp
        mov ax,[bp+5*2+4]
        mov ds,ax
        mov ah,0ah
        mov dx,[bp+6*2+4]
        sub dx,2
        int 21h
        mov si,dx
        inc si
        mov al,[si]
        mov ah,0
        add si,ax
        inc si
        mov byte ptr [si],0

        pop bp
        pop si
        pop ds
        pop dx
        pop ax
        ret 4
    _gets_ endp
__stdio__ ends
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