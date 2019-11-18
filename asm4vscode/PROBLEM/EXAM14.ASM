CSEG    SEGMENT
        ORG     100H
        ASSUME  CS:CSEG,DS:NOTHING
START:  JMP     MAIN
COUNT   DB      18
CHAR    DB      '0'
INT1C   PROC
        DEC     COUNT
        JNZ     EXIT
        MOV     COUNT,18
        PUSH    AX
        PUSH    BX
        PUSH    CX
        PUSH    DX
        MOV     AH,03
        MOV     BH,0
        INT     10H
        PUSH    DX
        MOV     AH,02
        MOV     DX,004FH
        INT     10H
        MOV     AL,CHAR
        MOV     AH,0AH
        MOV     CX,1
        INT     10H
        POP     DX
        MOV     AH,02
        INT     10H
        INC     CHAR
        CMP     CHAR,'9'
        JBE     OK
        MOV     CHAR,'0'
OK:     POP     DX
        POP     CX
        POP     BX
        POP     AX
EXIT:   IRET
INT1C   ENDP
MAIN:   MOV     DX,OFFSET INT1C
        MOV     AX,251CH
        INT     21H
        MOV     DX,OFFSET MAIN
        INT     27H
CSEG    ENDS
        END     START




