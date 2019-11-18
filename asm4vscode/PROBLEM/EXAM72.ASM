HTOA    PROC
        AND     AL,0FH
        CMP     AL,10
        JB      HTOA1
        ADD     AL,07H
HTOA1:  ADD     AL,30H
        RET
HTOA    ENDP
