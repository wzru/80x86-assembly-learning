.386
carriage_return macro
    mov ah,02h
    mov dl,0dh
    int 21h
    mov ah,02h
    mov dl,0ah
    int 21h
endm

N equ 1000

stack segment 
    db 200 dup(0)
stack ends

data segment 
    BUF db 'ZhangSan', 0, 0  ;学生姓名，不足10个字节的部分用0填充
    db 100, 85, 80, ?   ;平均成绩还未计算
    db 'LiSi', 6 dup(0) 
    db 80, 100, 70, ?  
    db N-3 dup('TempValue ', 0, 80, 90, 95, ?); 除了已经定义了的学生信息及成绩表外，其他学生的暂时成绩假定是一样的
    db 'WangZR', 6 dup(0)   ;最后一个必须修改为自己名字的拼音
    db 85, 85, 100, ?
    msg1 db 'Please input the name of student:', 13, 10, '$'
    msg2 db 'NOT FOUND!', 13, 10, '$'
    in_name_header db 10, ?;预留给DOS的区域, DOS回调时的长度信息存放处
    in_name db 10 dup(?);输入存放区域
    poin dw 0;存放偏移地址
data ends

code segment use16
     assume cs:code, ds:data, ss:stack
start:       
    mov ax, data
    mov ds, ax
    mov ax, stack
    mov ss, ax
    mov sp, 20
input:
    lea dx, offset msg1;输出提示信息
    mov ah, 09h
    int 21h
    mov in_name_header, 10
    lea dx, offset in_name_header
    mov ah, 0Ah;交给DOS输入
    int 21h
    carriage_return
    cmp in_name, 0dh;如果只输入了回车
    jz input
    cmp in_name, 'q'
    jnz process
    cmp in_name + 1, 0dh
    jz over
process:
over:
    mov ax, 4c00h
    int 21h
code ends 
end start