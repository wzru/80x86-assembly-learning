ifdef __base__
else
;@str:'asjdiooj'
;@asciiz:'asjdiojx',0
;@$tr:'asjdijax$'
;@16:16位
;@8:8位
;@signed:带符号数
;@reg:寄存器
;@i:立即数
;@or:或者
;@and:而且
;@identifier:标识符
;@label:可跳转的标签
;@type:通过dtype定义的标识符


;拓展指令:
;1.move @r16,@r8 将八位寄存器的内容送到十六位寄存器里 , @16不能是AX
;2.loadparam @i,@i,@r16 保护first@i个寄存器的情况下,取出通过堆栈传递的第second@i个参数,放到@16里
;attention:参数从1开始计数
;高效loadoaram的三个子命令(适用于多参的情况):
;3.使用前先loadstart取得bp值
;4.然后使用loadp @i,@i,@r16 意义和第2条指令一样
;5.最后用loadend恢复堆栈平衡

__base__ segment
    move macro r16,r8
        push ax
        mov al,r8
        cbw
        mov r16,ax
        pop ax
    endm
    loadstart macro
        push bp
        push sp
        pop bp
    endm
    loadp macro protected,paramid,target
        mov target,[bp+protected*2+4+paramid*2]
    endm
    loadend macro
        pop bp
    endm
    loadparam macro protected,paramid,target
        push bp
        push sp
        pop bp
        mov target,[bp+protected*2+4+paramid*2]
        pop bp
    endm
    call82 macro func,p81,p82
        push ax
        move ax,p82
        push ax
        move ax,p81
        push ax
        call func
        pop ax
    endm
    callso macro func,label
        push ax
        mov ax,offset label
        push ax
        mov ax,seg label
        push ax
        call func
        pop ax
    endm
    callso2 macro func,label,other_label
        push ax
        mov ax,offset other_label
        push ax
        mov ax,seg other_label
        push ax
        mov ax,offset label
        push ax
        mov ax,seg label
        push ax
        call func
        pop ax
    endm
    callso282 macro func,label,other_label,p81,p82
        push ax
        move ax,p82
        push ax
        move ax,p81
        push ax
        mov ax,offset other_label
        push ax
        mov ax,seg other_label
        push ax
        mov ax,offset label
        push ax
        mov ax,seg label
        push ax
        call func
        pop ax
    endm
    call0 macro func
        call func
    endm
    call1 macro func,p1
        push ax
        mov ax,p1
        push ax
        call func
        pop ax
    endm
    call2 macro func,p1,p2
        push ax
        mov ax,p2
        push ax
        mov ax,p1
        push ax
        call func
        pop ax
    endm
    call3 macro func,p1,p2,p3
        push ax
        mov ax,p3
        push ax
        mov ax,p2
        push ax
        mov ax,p1
        push ax
        call func
        pop ax
    endm
__base__ ends
endif