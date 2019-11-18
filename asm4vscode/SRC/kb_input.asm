datas segment
    tab db '0123456789ABCDEF'
datas ends
codes segment
    assume cs:codes,ds:datas
init:
    mov ax,datas
    mov ds,ax
main:
    mov bx,offset tab
    mov ah,01h          ;   getch()
    int 21h             ;al=

    mov ah,02h
    push ax             ;//putchar会改变al的值
    mov dl,' '          ;        ' '
    int 21h             ;putchar(   )
    pop ax              ;//所以必须保护
    mov cl,al           ;//保存al,
    shr al,1
    shr al,1
    shr al,1
    shr al,1            ;         先输出高4位所组成的16进制数
    xlat                ;/*查表*/   bx[al]
    mov dl,al           ;        dl=
    int 21h             ;putchar(         )
    mov al,cl           ;al=cl
    and al,0fh          ;al=al%16
    xlat                ;           bx[al]
    mov dl,al           ;        dl=
    int 21h             ;putchar(         )
    mov dl,0ah          ;        '\n'
    int 21h             ;putchar(    )
    jmp main            ;goto main

    mov ah,4ch
    int 21h
codes ends
end init