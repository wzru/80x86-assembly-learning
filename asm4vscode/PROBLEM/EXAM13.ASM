SSEG    SEGMENT STACK
        DB      100H DUP(0)
SSEG    ENDS
DSEG    SEGMENT
CHR     DB      'How are you?',0AH,0DH
        DB      'Fine thanks!',0AH,0DH
        DB      'See you later!',0AH,0DH,'$'
ERR     DB      0AH,0DH,'PRINTER ERROR! $'
DSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG
START:  MOV     AX,DSEG
        MOV     DS,AX
        LEA     SI,CHR
        MOV     DX,37AH
        MOV     CX,25
        MOV     AL,08H
        OUT     DX,AL
        LOOP    $
        MOV     AL,0CH
        OUT     DX,AL
AGAIN:  MOV     DX,379H
        IN      AL,DX
        TEST    AL,08H
        JZ      ERROR
        LODSB
        CMP     AL,'$'
        JZ      DONE
        CALL    PRINT
        JMP     AGAIN
DONE:   MOV     AH,4CH
        INT     21H
ERROR:  LEA     DX,ERR
        MOV     AH,9
        INT     21H
        JMP     DONE
        INCLUDE EXAM131.ASM
CSEG    ENDS
        END     START

