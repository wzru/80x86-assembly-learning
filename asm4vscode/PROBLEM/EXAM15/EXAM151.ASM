SSEG    SEGMENT STACK
        DB      80H DUP(?)
SSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,SS:SSEG
SEND    PROC    FAR
        PUSH    DS
        XOR     AX,AX
        PUSH    AX
        MOV     BX,4800
        MOV     AL,00000011B
        CALL    I8250
NEXT:   MOV     AH,1
        INT     21H
        CALL    SENDC
        TEST    AH,80H
        JNZ     EXIT
        CMP     AL,1BH
        JE      EXIT
        JMP     NEXT
EXIT:   RET
SEND    ENDP
INCLUDE I8250.ASM
INCLUDE SENDC.ASM
CSEG    ENDS
        END     SEND

