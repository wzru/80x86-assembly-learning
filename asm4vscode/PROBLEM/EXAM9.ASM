DSEG    SEGMENT
LIST    DW      9435H,6248H,5835H,4734H,8965H,7227H,8727H,2846H,5638H,4932H
LENT    DB      10
DSEG    ENDS
SSEG    SEGMENT STACK
STK     DB      20 DUP(0)
SSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG,SS:SSEG
START:  MOV     AX,DSEG
        MOV     DS,AX
        MOV     CH,LENT
        DEC     CH
X1:     MOV     SI,OFFSET LIST
        MOV     CL,CH
        XOR     BL,BL
X2:     MOV     AX,[SI]
        CMP     AX,[SI+2]
        JBE     X3
        MOV     DX,[SI+2]
        MOV     [SI+2],AX
        MOV     [SI],DX
        OR      BL,01
X3:     ADD     SI,2
        DEC     CL
        JNZ     X2
        AND     BL,BL
        JZ      STOP
        DEC     CH
        JNZ     X1
STOP:   MOV     AH,4CH
        INT     21H
CSEG    ENDS
        END     START
