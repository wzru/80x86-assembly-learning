DSEG    SEGMENT
ASKFN   DB      'File Name:$'
FNAME   DB      14,0,14 DUP(?)
ERROR   DB      'FILE ERROR!$'
BUFF    DB      512 DUP(?)
DSEG    ENDS
SSEG    SEGMENT STACK
STK     DB      80H DUP(0)
SSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG,SS:SSEG
START:  MOV     AX,DSEG
        MOV     DS,AX
        LEA     DX,ASKFN
        MOV     AH,09H
        INT     21H
        LEA     DX,FNAME
        MOV     AH,0AH
        INT     21H
        MOV     DL,0AH
        MOV     AH,02
        INT     21H
        MOV     BL,FNAME+1
        MOV     BH,0
        MOV     [BX+FNAME+2],BH
        LEA     DX,FNAME+2
        MOV     AX,3D00H
        INT     21H
        JC      EXIT
        MOV     BX,AX
AGAIN:  MOV     CX,512
        LEA     DX,BUFF
        MOV     AH,3FH
        INT     21H
        JC      EXIT
        PUSH    AX
        MOV     CX,AX
        MOV     SI,OFFSET BUFF
PUTC:   MOV     DL,[SI]
        INC     SI
        MOV     AH,02
        INT     21H
        LOOP    PUTC
        POP     AX
        CMP     AX,512
        JE      AGAIN
        MOV     AH,3EH
        INT     21H
        JMP     STOP
EXIT:   LEA     DX,ERROR
        MOV     AH,09
        INT     21H
STOP:   MOV     AH,4CH
        INT     21H
CSEG    ENDS
        END     START

