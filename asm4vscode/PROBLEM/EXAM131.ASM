PRINT   PROC    NEAR
        PUSH    DX
        PUSH    AX
        MOV     DX,379H
BUSY:   IN      AL,DX
        TEST    AL,80H
        JE      BUSY
        POP     AX
        PUSH    AX
        MOV     DX,378H
        OUT     DX,AL
        MOV     DX,37AH
        MOV     AL,1DH
        OUT     DX,AL
        AND     AL,1EH
        OUT     DX,AL
        POP     AX
        POP     DX
        RET
PRINT   ENDP

