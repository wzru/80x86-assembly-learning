SSEG    SEGMENT STACK
        DB      80 DUP(0)
SSEG    ENDS
DSEG    SEGMENT
KEYIP   DW      ?
KEYCS   DW      ?
BTOP    DW      ?
BTLL    DW      ?
BUFF    DW      16 DUP(0)
SCTAB   DB      0,1BH,'1234567890-=',08H
        DB      09H,'QWERTYUIOP[]',0DH
        DB      0,'ASDFGHJKL; '
        DB      0,'ZXCVBNM,./',0
        DB      0,0,20H,13 DUP(0)
        DB      '789-456+1230.',0
DSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG,SS:SSEG
KBPRG   PROC    FAR
        PUSH    DS
        XOR     AX,AX
        PUSH    AX
        MOV     BX,DSEG
        MOV     DS,BX
        CLI
        CLD
        MOV     ES,AX
        MOV     DI,9*4
        MOV     AX,ES:[DI]
        MOV     KEYIP,AX
        LEA     AX,KBINT
        STOSW
        MOV     AX,ES:[DI]
        MOV     KEYCS,AX
        MOV     AX,SEG KBINT
        STOSW
        LEA     AX,BUFF
        MOV     BTOP,AX
        MOV     BTLL,AX
        IN      AL,21H
        AND     AL,0FDH
        OUT     21H,AL
        STI
NEXT:   MOV     BX,BTOP
        CMP     BX,BTLL
        JZ      NEXT
        CLI
        MOV     AX,[BX]
        ADD     BX,2
        CMP     BX,OFFSET BUFF+32
        JNE     DISP
        LEA     BX,BUFF
DISP:   MOV     BTOP,BX
        STI
        CMP     AL,0
        JZ      NEXT
        CMP     AL,1BH
        JE      EXIT
        MOV     AH,2
        MOV     DL,AL
        INT     21H
        CMP     DL,0DH
        JNZ     NEXT
        MOV     AH,02
        MOV     DL,0AH
        INT     21H
        JMP     NEXT
EXIT:   CLI
        SUB     DI,4
        MOV     AX,KEYIP
        STOSW
        MOV     AX,KEYCS
        STOSW
        STI
        RET
KBPRG   ENDP
KBINT   PROC
        PUSH    AX
        PUSH    BX
        PUSH    SI
        IN      AL,60H
        PUSH    AX
        IN      AL,61H
        OR      AL,80H
        OUT     61H,AL
        AND     AL,7FH
        OUT     61H,AL
        POP     AX
        TEST    AL,80H
        JNZ     KBINT2
        MOV     BX,BTLL
        MOV     SI,BX
        ADD     BX,2
        CMP     BX,OFFSET BUFF+32
        JNE     KBINT1
        LEA     BX,BUFF
KBINT1: CMP     BX,BTOP
        JE      KBINT2
        MOV     BTLL,BX
        MOV     AH,AL
        LEA     BX,SCTAB
        XLAT
        MOV     [SI],AX
KBINT2: MOV     AL,20H
        OUT     20H,AL
        POP     SI
        POP     BX
        POP     AX
        IRET
KBINT   ENDP
CSEG    ENDS
        END     KBPRG
