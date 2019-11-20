# asm4vscode
## How to run and debug 80x86 assembly programs on Windows 10 using VS Code

First, all we do is ultimately running on virtual machine(DOSBOX). But we can simplify the operation using the `workspace` function of VS Code.

**This tool may NOT WORK in some cases.**

This tool is `asm4vscode` from [here](https://github.com/YouDad/asm4vscode). And you can also find it in this repository.

### How to use

1. Open VS Code, in the "file" menu item, press K to open a workspace.
2. In finder explorer, find our `asm4vscode` folder, open `ASM.CODE-workspace`

### How to start

1. in the `task` menu item, press R to run task
2. Then select `new_asm`
3. At terminal type in the new `asm` file name.
4. Because some old problem about dos, the file name must less or equal 8 and file name can only contain alphanumeric and a part of the character.
5. Then you can find the new `asm` file at left(Resource Manager).

### How to masm

open a `asm` file, if it's in `SRC` folder, run `masm_asm` task to `masm` the `asm` file.

else run `masm_exp` task to `masm` the `asm` file.

### How to execute

open a `asm` file, if it's in `SRC` folder, run `run_asm` task to execute the `asm` file corresponding executable file.

else run `run_exp` task to execute the `asm` file corresponding executable file.

### How to debug

open a `asm` file, if it's in `SRC` folder, run `debug_asm` task to debug the `asm` file corresponding executable file.

else run `debug_exp` task to debug the `asm` file corresponding executable file.

### How to list?

open a `asm` file, if it's in `SRC` folder, run `list_asm` task to generate the `asm` file corresponding list file.

else run `list_exp` task to generate the `asm` file corresponding list file.