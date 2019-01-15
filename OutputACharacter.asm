;Accept and prINT single cHaracter

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'Enter a character: $' 
    MSG2 DB 13,10,13,10,'Your input was: $'              

.CODE 
    START:
        MOV AX, @DATA
        MOV DS, AX
        
        MOV DX, OFFSET MSG1
        MOV AH, 9 
        INT 21H

        MOV AH, 1
        INT 21H

        MOV DX, OFFSET MSG2
        MOV AH, 9 
        INT 21H

        MOV DL, AL
        MOV AH, 2
        INT 21H

        MOV AH, 4CH
        INT 21H
    END START