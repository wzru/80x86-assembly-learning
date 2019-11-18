SSEG    SEGMENT STACK
        DB      80H DUP(?)
SSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,SS:SSEG
RECE    PROC    FAR
        PUSH    DS
        XOR     AX,AX
        PUSH    AX
        MOV     BX,4800
        MOV     AL,00000011B
        CALL    I8250
NEXT:   CALL    RECEC
        TEST    AH,80H
        JZ      YES
        TEST    AH,1
        JZ      NEXT
REXIT:   RET
YES:    CMP     AL,1BH
        JZ      REXIT
        MOV     DL,AL
        MOV     AH,2
        INT     21H
        CMP     DL,0DH
        JNZ     NEXT
        MOV     DL,0AH
        INT     21H
        JMP     NEXT
RECE    ENDP
        INCLUDE I8250.ASM
        INCLUDE RECEC.ASM
CSEG    ENDS
        END     RECE


