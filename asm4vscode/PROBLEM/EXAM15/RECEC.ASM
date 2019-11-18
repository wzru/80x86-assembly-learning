RECEC   PROC
        PUSH    DX
        PUSH    CX
        PUSH    BX
        MOV     DX,03FCH
        MOV     AL,03H
        OUT     DX,AL
        ADD     DX,2
        MOV     BH,50
DELAY1: XOR     CX,CX
DELAY2: IN      AL,DX
        TEST    AL,20H
        JNZ     READY1
        LOOP    DELAY2
        DEC     BH
        JNZ     DELAY1
        JMP     SHORT ERRR
READY1: DEC     DX
        MOV     BH,50
DELAY3: XOR     CX,CX
DELAY4: IN      AL,DX
        TEST    AL,01H
        JNZ     READY2
        LOOP    DELAY4
        DEC     BH
        JNZ     DELAY4
        JMP     SHORT TIOUT
READY2: MOV     DX,03F8H
        IN      AL,DX
        AND     AH,7FH
EXITR:  POP     BX
        POP     CX
        POP     DX
        RET
ERRR:   OR      AH,81H
        JMP     EXITR
TIOUT:  OR      AH,80H
        JMP     EXITR
RECEC   ENDP
