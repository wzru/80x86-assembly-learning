DSEG    SEGMENT
X1      DB      0AH,0BH,0CH,0DH,31H,32H,33H,34H
X2      DB      10,11,12,13,14,15,16,17
X3      DB      -1,-2,-3,-4,-5,-6,-7,-8
Y1      DB      25+25,78-34,15*4,90/3
Y2      DB      80 MOD 9,3 DUP(50H)
Y3      DB      'ABCDEFGH'
Z1      DW      1234H,5678H,0ABCDH,0ABEFH
Z2      DW      -1,-2,-3,-4,-5,-6,-7,-8
Z3      DW      OFFSET Y3,3 DUP(0),OFFSET Z2,3 DUP(?) 
DSEG    ENDS
        END
;cseg    segment
;        assume  cs:cseg,ds:dseg
;start:  MOV     AX,DSEG
;        MOV     DS,AX
;        mov     ax,004ch
;        int     21h
;cseg    ends
;        END START
