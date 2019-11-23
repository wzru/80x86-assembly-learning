# 80x86汇编笔记

## MOV

```assembly
mov reg, imm/reg/mem
mov mem, reg/seg
mov seg, reg/mem
```

- 不允许主存到主存的MOV

- 不允许段寄存器之间的直接数据传送
- 不允许段寄存器和立即数的MOV

- CS和IP不允许MOV, 往往通过JMP来控制

## 寻址方式

1. 直接寻址

```assembly
mov ax, [2000h] ;默认为DS段
mov ax, es:[2000h]
```

2. 寄存器间接寻址

```assembly
mov ax, [si] ;默认为DS段
```

只能是BX, SI, DI, BP；

3. 基址变址寻址

只有4种组合

```assembly
mov seg, [bx/bp + si/di]
```

bx默认段为ds, bp默认段为ss

4. 寄存器相对寻址

在2的基础上加上偏移的立即数

5. 相对基址变址寻址

在3的基础上加上偏移的立即数

## 位宽

有寄存器名时, 以寄存器名为准

无寄存器名时, 用`X ptr`来指定长度, 其中X可以为`byte`和`word`

例外: push只进行字操作

## MUL

```assembly
mul reg/mem
```

如果是8位，与AL相乘，结果放在AX

如果是16位，与AX相乘，结果放在DX AX

## DIV

```assembly
div reg/mem
```

如果除数为8位，则被除数为AX，AL存储商，AX存储余数

如果除数为16位，则被除数为DX AX，AX存储商，DX存储余数

## OFFSET

```assembly
TABLE DW 10，20，30，40，50
```

定义以TABLE为首地址的五个数据; DW指字类型

```assembly
MOV BX,OFFSET TABLE
```

将TABLE的首地址传送给[基址寄存器](https://www.baidu.com/s?wd=%E5%9F%BA%E5%9D%80%E5%AF%84%E5%AD%98%E5%99%A8&tn=SE_PcZhidaonwhc_ngpagmjz&rsv_dl=gh_pc_zhidao)BX，OFFSET + 标识符，表示取X的首地址，整个语句的[寻址方式](https://www.baidu.com/s?wd=%E5%AF%BB%E5%9D%80%E6%96%B9%E5%BC%8F&tn=SE_PcZhidaonwhc_ngpagmjz&rsv_dl=gh_pc_zhidao)为立即数寻址，MOV在这语句中
起传送地址的作用.此时BX=TABLE(表示地址.)

offset是汇编时期计算的偏移地址, 所以不能够OFFSET [SI], 因为寄存器的值只有程序执行的时候才能确定, 此时必须用LEA

## LEA

把源操作数的地址偏移量传送给目的寄存器

LEA 指令要求源操作数必须是[存储单元](https://baike.baidu.com/item/%E5%AD%98%E5%82%A8%E5%8D%95%E5%85%83)，而且目的操作数必须是一个除段寄存器之外的16位或32位寄存器。当目的[操作数](https://baike.baidu.com/item/%E6%93%8D%E4%BD%9C%E6%95%B0)是16位[通用寄存器](https://baike.baidu.com/item/%E9%80%9A%E7%94%A8%E5%AF%84%E5%AD%98%E5%99%A8)时，那么只装入[有效地址](https://baike.baidu.com/item/%E6%9C%89%E6%95%88%E5%9C%B0%E5%9D%80)的低16位。使用时要注意它与MOV指令的区别，MOV指令传送的一般是源操作数中的内容而不是地址。

```assembly
LEA reg16,mem
```

## CMP

```assembly
CMP REG, IMM/REG/MEM
CMP MEM, IMM/REG
```

cmp不能比较两个存储单元, 不能比较两个立即数

## 条件转移与无条件转移

条件转移只能段内转移, 即目标地址只能是在同一段内，且在当前IP地址-128~+127个单元的范围之内。这种寻址方式由于是相对于当前IP的，所以被称为相对寻址方式。

无条件转移可以段内(相对, 间接)和段间(直接, 简介)寻址(待完善细节)

## 基础数据类型

汇编语言基本数据类型汇总:

DB:Define Byte,定义字节(8位/1字节)无符号整数;等同于BYTE;

W:Define Word,定义字(16位/2字节)无符号整数;等同于WORD;

DD:Define DoubleWord,定义双字(32位/4字节)无符号整数;等同于DWORD;

DF:Defined Farword,定义三字(48位/6字节)无符号整数;等同于FWORD;

DQ:Define QuadWord,定义四字(64位/8字节)无符号整数;等同于QWORD;

DT:Define TenBytes,定义五字(80位/10字节)无符号整数;等同于TBYTE;

BYTE  : 8位无符号整数

WORD  : 16位无符号整数

DWORD : 32位无符号整数

QWORD : 64位整数

BYTE : 80位整数

SBYTE : 8位有符号整数

SWORD : 16位有符号整数

SDWORD: 32位有符号整数

FWORD : 48位整数(保护模式下作远指针)

REAL4 : 32位IEEE短实数

REAL8 : 64位IEEE长实数

REAL10: 80位IEEE扩展精度实数

## DUP

dup 在汇编中是一条[伪指令](https://baike.baidu.com/item/%E4%BC%AA%E6%8C%87%E4%BB%A4)，用来重复初始化数据

用法举例：

str1 db 10 dup ('!@#') ;这就是十个！@#

格式：db 重复的次数 dup (重复的内容)

注: ?表示未定义

## CLD

clear direction, 清除方向

SI, DI向前移动

## STD

与CLD相反

## Miscellaneous

  .386 ;指明指令集

.model flat,stdcall 程序工作模式,
flat为[Windows程序](https://www.baidu.com/s?wd=Windows%E7%A8%8B%E5%BA%8F&tn=SE_PcZhidaonwhc_ngpagmjz&rsv_dl=gh_pc_zhidao)使用的模式(代码和数据使用同一个4GB段),
stdcall为API调用时右边的参数先入栈

option casemap:none ;指明大小写敏感  

汇编源程序中立即数不能以字母开头, 否则要加0前缀