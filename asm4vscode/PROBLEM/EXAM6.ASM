DSEG    SEGMENT
DATA    DW      -3425H,1236H,-3454H
ABSM    DW      0
DSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG
START:  MOV     AX,DSEG
        MOV     DS,AX
        LEA     SI,DATA
        MOV     CX,3
        XOR     BX,BX
AGAIN:  MOV     AX,[SI]
        CALL    ABSX
        ADD     BX,AX
        INC     SI
        INC     SI
        LOOP    AGAIN
        MOV     ABSM,BX
        MOV     AH,4CH
        INT     21H

ABSX    PROC
        AND     AX,AX
        JNS     L1
        NEG     AX
L1:     RET
ABSX    ENDP
CSEG    ENDS
        END     START
