CSEG    SEGMENT
        ASSUME  CS:CSEG
START:  MOV     AX,0B800H
        MOV     DS,AX
        MOV     BX,40*2
        MOV     BP,25
AG:     MOV     BYTE PTR [BX],'Q'
        MOV     CX,0001H
        MOV     DX,86A0H
        MOV     AH,86H
        INT     15H
        MOV     BYTE PTR [BX],' '
        ADD     BX,80*2
        DEC     BP
        JNZ     AG
        MOV     AH,4CH
        INT     21H
CSEG    ENDS
        END     START


