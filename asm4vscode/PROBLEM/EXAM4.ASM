CSEG	SEGMENT
	ASSUME	CS:CSEG
START:  XOR     BX,BX
	MOV	AH,01
	INT	21H
        MOV     CH,AL
        SUB     AL,30H
        ADD     BL,AL
	MOV	AH,01
	INT	21H
        MOV     CL,AL
        SUB     AL,30H
        ADD     BL,AL
	MOV	AH,01
	INT	21H
        MOV     DH,AL
        SUB     AL,30H
        ADD     AL,BL
        XOR     AH,AH
	MOV	BH,3
	DIV	BH
        ADD     AL,30H
        MOV     BL,AL
        CMP     BL,CH
	JAE	NEXT1
        MOV     DL,CH
	MOV	AH,02
	INT	21H
NEXT1:  CMP     BL,CL
	JAE	NEXT2
        MOV     DL,CL
	MOV	AH,02
	INT	21H
NEXT2:  CMP     BL,DH
        JAE     DONE
        MOV     DL,DH
        MOV     AH,02
        INT     21H
DONE:   MOV     AH,4CH
        INT     21H
CSEG    ENDS
        END

