DSEG    SEGMENT
NUM     DD      6.1,3.07,8.5,-1.6,-6.4,7.04,0.85,-1.56,4.83,6.85
MAX     DW      ?
STA     DW      ?
DSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG
FMAX    PROC    FAR
        PUSH    DS
        XOR     DX,DX
        PUSH    AX
        MOV     AX,DSEG
        MOV     DS,AX
        LEA     BX,NUM
        MOV     MAX,BX
        MOV     CX,0AH
        FINIT
        FLD     DWORD PTR[BX]
NEXT:   ADD     BX,4
        FCOM    DWORD PTR[BX]
        FSTSW   STA
        FWAIT
        TEST    BYTE PTR STA+1,41H
        JZ      STLA
        MOV     MAX,BX
        FSTP    ST
        FLD     DWORD PTR[BX]
STLA:   LOOP    NEXT
        RET
FMAX    ENDP
CSEG    ENDS
        END     FMAX
