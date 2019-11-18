datas  segment
    tab db 48 dup(0),0,1,2,3,4,5,6,7,8,9,7 dup(0),10,11,12,13,14,15,26 dup(0),10,11,12,13,14,15
    rtab db '0123456789ABCDEF'
    SUM db ?
datas  ends
putchar macro char
    push ax
    push dx
    mov ah,2
    mov dl,char
    int 21h
    pop dx
    pop ax
    endm
codes  segment
    assume cs:codes,ds:datas
main:
    mov ax,datas
    mov ds,ax

    mov bx,offset tab

    putchar '5'
    putchar '*'
    mov ah,1
    int 21h
    xlat
    mov cl,al
    shl cl,1
    shl cl,1
    add cl,al
    putchar '+'
    mov ah,1
    int 21h
    xlat
    add cl,al
    putchar '='
    mov bx,offset rtab
    mov ah,2

    mov al,cl
    shr al,1
    shr al,1
    shr al,1
    shr al,1
    xlat
    mov dl,al
    int 21h

    mov al,cl
    and al,15
    xlat
    mov dl,al
    int 21h
    putchar 'H'
    
    mov  ah,4ch
    int  21h

codes  ends
end  main
