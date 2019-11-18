include base.asm
include stdio.asm
ifdef __file__
else
__file__ segment
    ;define list
    ;1.dfile @identifier,@str
    ;function list
    ;1.void fopen(@file,@16,@i)
    ;2.void fclose(@file)
    ;3.void ferror(@file,@label)
    ;4.ax fgets (@file,@buffer)

    ;1.dfile @identifier,@str
    ;define file data,name is the file's description
    ;dfile macro fp,fname

    ;1.void fopen(@file,@16,@i)
    ;use @file to open @16 by mode @i
    ;fopen macro fp,path,mode

    ;2.void fclose(@file)
    ;use @file to close file
    ;fclose macro fp

    ;3.void ferror(@file,@label)
    ;define codes warning and then jmp @label
    ;ferror macro fp,finally

    ;4.ax fgets (@file,@buffer)
    ;read @file file and save into buffer
    ;ax is readed bytes,0 is meaning eof
    ;fgets macro fp,buffer

    ;fp:@identifier,fname:@fname
    dfile macro fp,fname
        handle_&fp dw 0
        error_open_&fp db 'open file fail!$'
        error_read_&fp db 'read file fail!$'
        name_&fp db fname,0
        r = 0   ;;mode:read
        w = 1   ;;mode:write
        rw = 3  ;;mode:read&write
    endm
    ;fp:@file,path:@16,mode:@i
    fopen macro fp,path,mode
        push ax
        push dx
        mov dx,path
        mov ah,3dh
        mov al,mode ;;r/w/rw
        int 21h
        jc open_fail$&fp
        mov handle_&fp,ax
        pop dx
        pop ax
    endm
    ;fp:@file
    fclose macro fp
        push ax
        push bx
        mov bx,handle_&fp
        mov ah,3eh
        int 21h
        pop bx
        pop ax
    endm
    ;fp:@file,finally:@label
    ferror macro fp,finally
        open_fail$&fp:
            put$ error_open_&fp
            putchar ':'
            puts name_&fp
            jmp finally
        read_fail$&fp:
            fclose fp
            put$ error_read_&fp
            putchar ':'
            puts name_&fp
            jmp finally
    endm
    ;fp:@file,buffer:@buffer
    ;in:fp-file pointer,buffer-cache head pointer
    ;out:ax=readed bytes,0 is eof
    fgets macro fp,buffer
        push bx
        push cx
        push dx
        mov ah,3fh
        lea dx,buffer
        mov bx,handle_&fp
        xor cx,cx
        mov cl,pre_&buffer
        int 21h
        jc read_fail$&fp
        mov bx,offset pre_&buffer
        inc bx
        mov [bx],al
        pop dx
        pop cx
        pop bx
    endm
__file__ ends
endif