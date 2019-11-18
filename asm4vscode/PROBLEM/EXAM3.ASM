dseg    segment
ral     db      ?
htab	db	'0123456789ABCDEF'
dseg    ends
cseg    segment
        assume  cs:cseg,ds:dseg
start:  mov     ax,dseg
        mov     ds,ax
        mov     ah,01h		;输入第一个数
        int     21h
        sub     al,30h
        mov     bl,al
        mov     dl,'+'		;显示加号
        mov     ah,02h
        int     21h
        mov     ah,01h		;输入第二个数
        int     21h
        sub     al,30h
        add     bl,al
        mov     ral,bl		;保存结果到ral单元
        mov     dl,'='		;显示“=”号
        mov     ah,02h
        int     21h
        mov     al,bl       ;al=a+b
        mov	    ch,bl       ;ch=a+b
        mov	    cl,4
        shr	    al,cl       ;al/=16
        lea	    bx,htab     ;bx=&htab
        xlat                ;al=bx[al]
        mov	    dl,al		;显示结果十位上的数
        mov	    ah,02h
        int	    21h
        and	    ch,0fh      ;ch%=16
        mov	    al,ch       ;al=ch
        xlat
        mov	    dl,al
        mov	    ah,02h
        int	    21h
        mov     dl,'h'		;显示字符“h”
        mov     ah,02h
        int     21h
        mov     ah,4ch
        int     21h
cseg    ends
        end     start