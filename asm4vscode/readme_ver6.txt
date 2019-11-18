var3:
讲一下这里文件的用途:
 ASMPROJECT		--汇编工程/多文件项目
 ASMSINGLEFILE		--汇编单文件
 |- .vscode		--vscode文件夹 的 配置文件夹
 |- list.lst		--list_asm所默认生成的列表文件
 |- hw.asm		--hello world例程
 DOSBOX			--放有dosbox及运行库,用以运行编译出来的可执行文件
 EXE			--默认编译出来的程序存放的位置
 |- DEBUG.EXE		--用于调试汇编程序的程序
 |- debug_exe.bat	--用于一键拖拽调试程序(拖入exe)
 |- run_and_type.exe	--用于配合一键拖拽调试程序
 |- run_exe.bat		--用于直接用dosbox打开拖入程序
 MASM			--放有编译用到的程序(拖入exe)
 PROBLEM		--从机房拷来的源程序...(别问我有什么用,我也不知道:)
 |- .vscode		--vscode文件夹 的 配置文件夹
 |- list.lst		--list_asm所默认生成的列表文件
 asmexp.code-workspace	--vscode的工作区文件
 debug_asm.bat		--用于一键调试被拖入程序(拖入asm)
 list_asm.bat		--用于一键生成被拖入源程序的列表文件(拖入asm)
 make_asm.bat		--用于一键编译被拖入的源程序(拖入asm)
 new_asm.bat		--用于生成一个含有helloworld例程的asm文件
 readme_ver3.txt	--自述文件 作者:Karl 有什么bug请投PSR过程文件(自行百度)到 1632083718@qq.com
 run_asm.bat		--用于一键编译执行被拖入的源程序(拖入asm)

var4:
改变new_asm.bat,新增功能:创建asm文件名字不能超过8位
原因:dosbox不能识别超过8位的文件名,所以在创建时就限制可以避免这个问题

var5:2018年5月5日02:02:07
1.一次全新的更新,新增功能:再也不用debug_asm之后用q退出再debug exe了.
2.采用了call模式的批处理编写,使得代码结构更加清晰
3.run_and_type.exe被遗弃
4.debug_exe.bat被遗弃
5.新增dosbox的conf文件,在dosbox文件夹下
6.ASMPROJECT被遗弃,几乎没有用到
文件结构将变为:
 ASMSINGLEFILE		--汇编单文件
 |- .vscode		--vscode文件夹 的 配置文件夹
 |- list.lst		--list_asm所默认生成的列表文件
 |- hw.asm		--hello world例程
 DOSBOX			--放有dosbox及运行库,用以运行编译出来的可执行文件
 |- DOSBox.exe		--DOSBox主程序
 |- DosBoxConfig.conf	--DOSBox配置文件
 |- SDL.dll		--DOSBox运行库
 |- SDL_net.dll		--DOSBox运行库
 EXE			--默认编译出来的程序存放的位置
 |- DEBUG.EXE		--用于调试汇编程序的程序
 |- hw.exe		--hello world可执行程序
 |- run_exe.bat		--用于直接用dosbox打开拖入程序(拖入exe)
 MASM			--放有编译用到的程序
 |- LINK.EXE		--链接程序
 |- MASM.EXE		--宏汇编程序
 |- ML.ERR		--错误代码文件
 |- ml.exe		--被LINK.EXE所用的程序
 PROBLEM		--从机房拷来的源程序...(别问我有什么用,我也不知道:)
 |- .vscode		--vscode文件夹 的 配置文件夹
 |- list.lst		--list_asm所默认生成的列表文件
 |- EXAM**.ASM		--样例**程序
 asm.code-workspace	--vscode的工作区文件
 debug_asm.bat		--用于一键调试被拖入程序(拖入asm)
 get_filename.bat	--获得文件名的子程序
 list_asm.bat		--用于一键生成被拖入源程序的列表文件(拖入asm)
 make_asm.bat		--用于一键编译被拖入的源程序(拖入asm)
 new_asm.bat		--用于生成一个含有helloworld例程的asm文件
 readme_ver5.txt	--自述文件 作者:Karl 有什么bug请投PSR过程文件
			--(自行百度)到 1632083718@qq.com
 run_asm.bat		--用于一键编译执行被拖入的源程序(拖入asm)
 run_dosbox.bat		--用于打开dosbox的子程序
 set_path.bat		--用于设置环境变量的子程序

var6:2018年5月5日16:38:48		!暂时确定这一版是最终版!
1.优化dosbox打开参数
2.new_asm时不能以dubug作为文件名新建了.防止覆盖DEBUG.EXE
3.新增了中断说明文件和ascii码对照表
4.ASMSINGLEFILE文件夹名改为SRC,更加贴切
5.修复了之前PROBLEM文件夹里的汇编不能打开错误
6.恢复了可拖入程序的debug_exe.bat
7.修改了文件名称:全大写字母构成的文件和文件夹是必须的文件和文件夹
  删除后可能会有不可预知的错误出现(还包括.vscode文件夹及其内部文件)
文件结构将变为:
 SRC			--汇编单文件
 |- .vscode		--vscode文件夹的配置文件夹
 |- list.lst		--list_asm所默认生成的列表文件
 |- hw.asm		--hello world例程
 DOSBOX			--放有dosbox及运行库,用以运行编译出来的可执行文件
 |- DOSBox.exe		--DOSBox主程序
 |- DosBoxConfig.conf	--DOSBox配置文件
 |- SDL.dll		--DOSBox运行库
 |- SDL_net.dll		--DOSBox运行库
 EXE			--默认编译出来的程序存放的位置
 |- DEBUG.EXE		--用于调试汇编程序的程序
 |- hw.exe		--hello world可执行程序
 |- run_exe.bat		--用于直接用dosbox打开拖入程序(拖入exe)
 MASM			--放有编译用到的程序
 |- LINK.EXE		--链接程序
 |- MASM.EXE		--宏汇编程序
 |- ML.ERR		--错误代码文件
 |- ML.EXE		--被LINK.EXE所用的程序
 PROBLEM		--从机房拷来的源程序...(别问我有什么用,我也不知道:)
 |- .vscode		--vscode文件夹 的 配置文件夹
 |- list.lst		--list_asm所默认生成的列表文件
 |- EXAM**.ASM		--样例**程序
 ASM.CODE-WORKSPACE	--vscode的工作区文件
 DEBUG_ASM.BAT		--用于一键调试被拖入程序(拖入asm)
 GET_FILENAME.BAT	--获得文件名的子程序
 LIST_ASM.BAT		--用于一键生成被拖入源程序的列表文件(拖入asm)
 MAKE_ASM.BAT		--用于一键编译被拖入的源程序(拖入asm)
 NEW_ASM.BAT		--用于生成一个含有helloworld例程的asm文件
 readme_ver6.txt	--自述文件 作者:Karl 有什么bug请投PSR过程文件
			--(自行百度)到 1632083718@qq.com
 RUN_ASM.bat		--用于一键编译执行被拖入的源程序(拖入asm)
 RUN_DOSBOX.bat		--用于打开dosbox的子程序
 SET_PATH.bat		--用于设置环境变量的子程序