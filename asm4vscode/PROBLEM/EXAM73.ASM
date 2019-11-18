BHTOA   PROC    NEAR
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


