datarea segment
    string1 db 'move the cursor backward.'
    string2 db 'move the cursor backward.'
    mess1 db 'Match!',13,10,'$'
    mess2 db 'No match!',13,10,'$'
datarea ends
program segment
main proc far
    assume cs:program, ds:datarea, es:datarea
start:
    push ds
    sub ax,ax
    push ax
    mov ax,datarea
    mov ds,ax
    mov es,ax
    lea si,string1
    lea di,string2
    cld
    mov cx,25
    repz cmpsb
    jz match
    lea dx,mess2
    jmp short disp
match:
    lea dx,mess1
disp:
    mov ah,09
    int 21h
    ret
main endp
program ends
    end start
    