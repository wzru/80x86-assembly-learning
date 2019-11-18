SENDC   PROC
        PUSH    DX
        PUSH    CX
        PUSH    BX
        PUSH    AX
        MOV     DX,03FCH
        MOV     AL,03H
        OUT     DX,AL
        ADD     DX,2
        MOV     BH,50
WAIT1:  XOR     CX,CX
WAIT2:  IN      AL,DX
        AND     AL,30H
        CMP     AL,30H
        JE      READY1
        LOOP    WAIT2
        DEC     BH
        JNZ     WAIT1
        JMP     SHORT ERRS
READY1: DEC     DX
        MOV     BH,50
WAIT3:  XOR     CX,CX
WAIT4:  IN      AL,DX
        TEST    AL,20H
        JNZ     READY2
        LOOP    WAIT4
        DEC     BH
        JNZ     WAIT3
        JMP     SHORT ERRS
READY2: MOV     DX,03F8H
        POP     AX
        OUT     DX,AL
        AND     AH,7FH
EXITS:  POP     BX
        POP     CX
        POP     DX
        RET
ERRS:   POP     AX
        OR      AH,80H
        JMP     EXITS
SENDC   ENDP




