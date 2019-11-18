# 常用功能
## q:quit 退出
### 调用形式:
### -q
## r:register 寄存器
### 调用形式:
> -r
>
> -r reg\n val

![img](IMAGE/R.png "r命令例子")

### 注意:
>*r*会列出所有寄存器状态
>
>*r cx\n 100*的意思是把cx的值修改成100

## d:display 显示内存单元
### 调用形式:
> -d
>
> -d (ds:)aa
>
> -d aa:bb
>
> -d aa:bb Lcc
>
> -d aa:bb cc

![img](IMAGE/D0.png "d命令例子")
![img](IMAGE/D1.png "d命令例子")

### 注意:
>*d*第一次执行相当于d cs:ip
>
>*d*非第一次执行是在上一次的基础上多显示80H个单元
>
>*d*后面可以接数字或段寄存器名,比如d ds:0
>
>**
>
>*r cx\n 100*的意思是把cx的值修改成100

g

u

t

p

# 不常用功能

h val1 val2

e start

f [范围] [填充列表]

m [范围] [位置]

c

s

a

i

o

# 不需要功能

n,w,l