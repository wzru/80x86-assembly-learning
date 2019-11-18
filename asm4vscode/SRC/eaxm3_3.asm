datas  segment
    tab db 48 dup(0),0,1,2,3,4,5,6,7,8,9,7 dup(0),10,11,12,13,14,15,26 dup(0),10,11,12,13,14,15
    rtab db '0123456789ABCDEF'
    SUM db ?
datas  ends
    
codes  segment
    assume cs:codes,ds:datas
main:
    mov ax,datas
    mov ds,ax
    mov bx,offset tab
    ;读入一个十六进制数放到cl
    mov ah,1
    int 21h
    xlat
    mov cl,al
    ;输出'*'
    mov ah,2
    mov dl,'*'
    int 21h
    ;再读入一个十六进制数和cl相乘,将计算结果放入SUM单元
    mov ah,1
    int 21h
    xlat
    mul cl
    mov SUM,al
    mov cl,al
    ;输出'='
    mov ah,2
    mov dl,'='
    int 21h
    ;设定表为输出表
    mov bx,offset rtab
    ;由于2个1位十六进制数相乘不会超过两位,所以只输出al,ah放2用以输出
    mov ah,2
    ;输出高4位
    mov al,cl
    shr al,1
    shr al,1
    shr al,1
    shr al,1
    xlat
    mov dl,al
    int 21h
    ;输出低4位
    mov al,cl
    and al,0fh
    xlat
    mov dl,al
    int 21h
    ;输出H
    mov ah,2
    mov dl,'H'
    int 21h
    ;结束程序
    mov  ah,4ch
    int  21h
codes  ends
end  main
