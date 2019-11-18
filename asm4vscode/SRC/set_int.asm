;设置中断向量
mov ax,0
mov es,ax
cld
mov di,0fh*4
mov ax,offset prnsrv
stosw
mov ax,seg prnsrv
stosw
;屏蔽int15
in al,21h;主控21 从属a1
and al,01111111B
out 21h,al
nop
nop
;out...
;nop为了等外设反应