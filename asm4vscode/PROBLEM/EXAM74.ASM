WHTOA   PROC    NEAR
        PUSH    AX
        MOV     AL,AH
        CALL    BHTOA
        MOV     BX,AX
        POP     AX
        CALL    BHTOA
        RET
WHTOA   ENDP
