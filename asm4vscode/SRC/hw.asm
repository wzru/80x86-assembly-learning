;完整段的Hello World程序
datas  segment
    string  DB  'Hello World!$'
datas  ends

codes  segment
main:
    mov ax,datas
    mov ds,ax
    
    lea dx,string
    mov  ah,9
    int  21h
    
    mov  ah,4ch
    int  21h
codes  ends
end  main