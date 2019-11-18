DSEG    SEGMENT
DATA1   DB      15H,46H,83H
DATA2   DB      10H,58H,45H
LEGH    DW      3
DIF     DB      3 DUP(0)
DSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG,ES:DSEG
START:  MOV     AX,DSEG
        MOV     DS,AX
        MOV     ES,AX
        LEA     SI,DATA1
        LEA     BX,DATA2
        LEA     DI,DIF  
        MOV     CX,LEGH 
        CLD             
        CLC             
AGAIN:  LODSB
        SBB     AL,[BX]
        STOSB      
        INC     BX 
        LOOP    AGAIN
        MOV     AH,4CH
        INT     21H
CSEG    ENDS
        END     START
