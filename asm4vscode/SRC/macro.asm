putchar macro char
    x_&char db ?
    mov ah,02h
    int 21h
    endm

datas  segment
    string  DB  'Hello World!$'
datas  ends

codes  segment
    assume cs:codes,ds:datas
main:
    mov ax,datas
    mov ds,ax

    putchar h
    putchar e

    mov  ah,4ch
    int  21h
codes  ends
end  main
