SSEG	SEGMENT	STACK
        DB      80H  DUP(?)
SSEG	ENDS
CSEG	SEGMENT
        ASSUME  CS:CSEG,SS:SSEG
HTOA    PROC    ;该子程序的功能是将AL内容转换为ASCII码
        AND     AL,0FH
        CMP     AL,10
        JC      HTOA1
        ADD     AL,07
HTOA1:  ADD     AL,30H
        RET
HTOA    ENDP
BHTOA   PROC    ;该子程序的功能是将AL内容转换为ASCII码
        PUSH    CX
        MOV     CH,AL
        MOV     CL,04
        SHR     AL,CL
        CALL    HTOA
        MOV     AH,AL
        MOV     AL,CH
        CALL    HTOA
        POP     CX
        RET
BHTOA   ENDP
DISASC  PROC    ;该子程序的功能是在当前光标处显示AL中的字符
        PUSH    AX
        MOV     AH,14
        INT     10H
        POP     AX
        RET
DISASC  ENDP
DISAL   PROC    ;该子程序的功能是显示AL中的内容
        PUSH    AX
        CALL    BHTOA
        XCHG    AH,AL
        CALL    DISASC
        MOV	AL,AH
        CALL    DISASC
        POP     AX
        RET
DISAL	ENDP
BIOS:   PUSH    DS
        XOR     AX,AX
        PUSH    AX
AGAIN:  MOV     AH,0
        INT     16H
        PUSH    AX
        CALL    DISAL
        MOV     AL,'-'
        CALL    DISASC
        MOV     AL,AH
        CALL    DISAL
        MOV     AL,' '
        CALL    DISASC
        POP     AX
        CMP     AL,03H
JNZ     AGAIN
        RET
CSEG	ENDS
        END     BIOS


