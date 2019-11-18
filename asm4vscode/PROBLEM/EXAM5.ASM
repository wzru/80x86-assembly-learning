DSEG    SEGMENT
DATA    DB      63H,28H,64H,32H,45H
CNT     DB      5
AVER    DB      ?
VALU    DB      5 DUP(?)
DSEG    ENDS

CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG
START:  MOV     AX,DSEG
        MOV     DS,AX
        MOV     CL,CNT
        PUSH    CX
        XOR     AX,AX
        LEA     SI,DATA
AG1:    ADD     AL, BYTE PTR [SI]
        ADC     AH,0
        INC     SI
        LOOP    AG1
        POP     CX
        DIV     CL
        MOV     AVER,AL

        ;XOR     BP,BP
        LEA     SI,DATA
AG2:    CMP     AL,BYTE PTR [SI]
        JA      NEXT
        MOV     BL,[SI]
        MOV     VALU[BP],BL
        INC     BP
NEXT:   INC     SI
        LOOP    AG2
        MOV     AH,4CH
        INT     21H
CSEG    ENDS
        END     START
