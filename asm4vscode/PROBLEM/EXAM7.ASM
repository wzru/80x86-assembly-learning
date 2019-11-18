SSEG    SEGMENT STACK
STK     DB      50 DUP(0)
SSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,SS:SSEG
START:  MOV     AX,SSEG
        MOV     SS,AX
        XOR     DX,DX
        MOV     AL,2
LOOP1:  INC     AL
        CALL    PRIME
        JNC     NEXT
        XOR     AH,AH
        ADD     DX,AX
NEXT:   CMP     AL,255
        JB      LOOP1
        MOV     AX,DX
        CALL    WHTOA
        PUSH    AX
        MOV     DL,BH
        MOV     AH,02
        INT     21H
        MOV     DL,BL
        MOV     AH,02
        INT     21H
        POP     BX
        MOV     DL,BH
        MOV     AH,02
        INT     21H
        MOV     DL,BL
        MOV     AH,02
        INT     21H
        MOV     AH,4CH
        INT     21H
        INCLUDE EXAM71.ASM
        INCLUDE EXAM72.ASM
        INCLUDE EXAM73.ASM
        INCLUDE EXAM74.ASM
CSEG    ENDS
        END     START

