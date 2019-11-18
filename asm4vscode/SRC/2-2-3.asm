.386

N equ 100

stack segment use16
    db 200 dup(0)
stack ends

data segment use16
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
calc_avg:
    mov bx, offset BUF
    mov cx, N
    calc_avg_iterator:
        xor ah, ah
        mov al, [bx+10];A成绩
        shl ax, 1
        add al, [bx+11]
        adc ah, 0;处理1字节无法存储的情况
        shl ax, 1
        add al, [bx+12];这里相当于算((((A<<1)+B)<<1)+C)/7
        adc ah, 0
        mov dl, 7
        div dl
        mov [bx+13], al
        add bx, 14
    loop calc_avg_iterator
over:
    mov ax, 4c00h
    int 21h
code ends 
end start