dseg segment
    text db "Oh yeah,that's good!"
    cnt dw 20
    key db "ddf"
    kcnt dw 3
dseg ends
cseg segment
        assume cs:cseg,ds:dseg
main:   mov ax,dseg
        mov ds,ax
$init:  ;初始化串指针
        mov si,offset text
        mov di,offset key
        ;初始化串尾指针
        mov bx,cnt
        mov dx,kcnt
        add bx,offset text
        add dx,offset key
$loop:  ;循环开始
        mov al,[di]
        xor [si],al
        ;串指针后移
        inc di
        inc si
        ;判母串是否异或完
        cmp si,bx       ;cmp si,offset text+cnt
        jz $end
        ;判子串是否用完
        cmp di,dx
        jnz $loop
        ;用完了就再指向子串首
        sub di,kcnt
        jmp $loop
$end:
        mov ax,4c00h
        int 21h
cseg ends
end main