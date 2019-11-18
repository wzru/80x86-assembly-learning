系统基础中断
    0H 除以零
    1H 单步(用于DEBUG)
    2H 非屏蔽中断
    3H 断点指令(用于DEBUG)
    4H 溢出
    5H 打印屏幕
    6H 保留
    7H 保留
8259中断向量
    8H 定时器
    9H 键盘
    AH 彩色/图形
    BH 异步通讯(secondary)
    CH 异步通讯(primary)
    DH 硬磁盘
    EH 软磁盘
    FH 并行打印机
BIOS中断
    10H 屏幕显示
    11H 设备检验
    12H 测定存储器容量
    13H 磁盘I/O
    14H 串行通讯口I/O
    15H 盒式磁带I/O
    16H 键盘输入
    17H 打印机输出
    18H BASIC入口代码
    19H 引导装入程序
    1AH 日时钟
提供给用户的中断
    1BH Ctrl-Break控制的软中断
    1CH 定时器控制器的软中断
数据表指针
    1DH 显示器参量表
    1EH 软盘参量表
    1FH 图形表
DOS中断
    20H 程序结束
    21H 系统功能调用
    22H 结束退出
    23H Ctrl-Break退出
    24H 严重错误处理
    25H 绝对磁盘读功能
    26H 绝对磁盘写功能
    27H 驻留退出
    28H-2EH DOS保留
    2FH 打印机
    30H-3FH DOS保留
BASIC中断
    40H Basic保留
    41H-5FH 保留
    60H-67H 用户软中断
    68H-7FH 保留
    80H-85H 由BASIC保留
    86H-F0H BASIC中断
    F1H-FFH 保留