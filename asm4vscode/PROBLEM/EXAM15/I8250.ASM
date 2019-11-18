I8250   PROC
        CMP     BX,50
        JB      BADP
        CMP     BX,9600
        JA      BADP
        PUSH    DX
        PUSH    AX
        MOV     AX,0C200H
        MOV     DX,0001H
        DIV     BX
        PUSH    AX
        MOV     DX,03FBH
        MOV     AL,80H
        OUT     DX,AL
        POP     AX
        MOV     DX,03F8H
        OUT     DX,AL
        INC     DX
        MOV     AL,AH
        OUT     DX,AL
        MOV     DX,03FBH
        POP     AX
        AND     AL,3FH
        OUT     DX,AL
        SUB     DX,2
        MOV     AL,0
        OUT     DX,AL
        POP     DX
        AND     AH,7FH
        RET
BADP:   OR      AH,80H
        RET
I8250   ENDP

