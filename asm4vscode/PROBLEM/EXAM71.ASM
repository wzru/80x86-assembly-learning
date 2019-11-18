PRIME   PROC    NEAR
        PUSH    BX
        PUSH    CX
        PUSH    AX
        POP     CX
        SHR     CL,1
        MOV     CH,2
PRIME1: PUSH    AX
        XOR     AH,AH
        DIV     CH
        AND     AH,AH
        JZ      PRIME2
        INC     CH
        CMP     CH,CL
        JAE     PRIME3
        POP     AX
        JMP     PRIME1
PRIME2: CLC
        POP     AX
        JMP     PRIME4
PRIME3: STC
        POP     AX
PRIME4: POP     CX
        POP     BX
        RET
PRIME   ENDP
