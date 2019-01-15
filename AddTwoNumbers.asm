.MODEL SMALL
.STACK 100h

.DATA
    NUM1 DB ?
    NUM2 DB ?
    RESULT DB ?
    MSG1 DB 10,13,"Enter first number to add : $"
    MSG2 DB 10,13,"Enter second number to add : $"
    MSG3 DB 10,13,"Result of Addition is : $"

.CODE
    START:
        MOV AX, @DATA
        MOV DS, AX

    FIRST_NUMBER:
        LEA DX, MSG1
        MOV AH,9
        INT 21H
        
        MOV AH, 1
        INT 21H
        CMP AL,'0'      ;check if it is in range from 0 - 9
        JB FIRST_NUMBER
        CMP AL,'9'
        JA FIRST_NUMBER
        SUB AL, 30H
        MOV NUM1,AL
        
    SECOND_NUMBER:
        LEA DX, MSG2
        MOV AH, 9
        INT 21H
        
        MOV AH, 1
        INT 21H  
        CMP AL,'0'      ;check if it is in range from 0 - 9
        JB SECOND_NUMBER
        CMP AL,'9'
        JA SECOND_NUMBER
        SUB AL, 30H
        MOV NUM2, AL
        
        ADD AL, NUM1
        MOV RESULT, AL
        MOV AH, 0
        AAA
        
        ADD AH, 30H
        ADD AL, 30H
        MOV BX, AX
        LEA DX, MSG3
        MOV AH, 9
        INT 21H
        
        
        MOV DL, BH
        MOV AH, 2
        INT 21H
         
        MOV AH, 2
        MOV DL, BL
        INT 21H

        MOV AH, 4CH
        INT 21H
END START
