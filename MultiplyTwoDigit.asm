.Model SMALL
.DATA
     NUM1 DB ?
     NUM2 DB ?
     RESULT DB ?
     MSG1 DB 10,13,"ENTER FIRST NUMBER TO MULTIPLY : $"
     MSG2 DB 10,13,"ENTER SECOND NUMBER TO MULTIPLY : $"  
     MSG3 DB 10,13,"RESULT OF MULTIPLICATION IS : $"
     DIG1 DB  0
     DIG2 DB  0

.CODE 
    START:
        MOV AX,@DATA
        MOV DS,AX
        
    FIRST_NUMBER:     
        MOV dx, OFFSET MSG1 ; move msg1 to dx register
        MOV AH,9 ;  Output Mg1  
        INT 21H
      
        MOV AH,1 ; accept a character from the keyboard
        INT 21H
        CMP AL,'0'      ;check if it is in range from 0 - 9
        JB FIRST_NUMBER
        CMP AL,'9'
        JA FIRST_NUMBER
        SUB AL,30H
        MOV DIG1,AL
      
        MOV AH,1 ; accept a character from the keyboard
        INT 21H
        CMP AL,'0'      ;check if it is in range from 0 - 9
        JB FIRST_NUMBER
        CMP AL,'9'
        JA FIRST_NUMBER
        SUB AL,30H
        MOV DIG2,AL
        
        MOV AL,DIG1     ;convert 1st digit to tens place
        MOV BL,10
        MUL BL
        MOV NUM1,AL     ;add 1st digit to 2nd digit
        MOV AL,DIG2
        ADD NUM1,AL

   SECOND_NUMBER:     
        MOV DX, OFFSET MSG2 ; move msg2 to dx register
        MOV AH,9 ; Output msg2
        INT 21H
     
        MOV AH,1 ; accept a character from the keyboard
        INT 21H
        CMP AL,'0'      ;check if it is in range from 0 - 9
        JB SECOND_NUMBER
        CMP AL,'9'
        JA SECOND_NUMBER
        SUB AL,30H ; convert the ascii to a number 
        MOV DIG1,AL ;move al register to Dig1
      
        MOV AH,1 ; accept a character from the keyboard
        INT 21H
        CMP AL,'0'      ;check if it is in range from 0 - 9
        JB SECOND_NUMBER
        CMP AL,'9'
        JA SECOND_NUMBER
        SUB AL,30H ; convert the ascii to a number
        MOV DIG2,AL  ;move al register to Dig2 
        
        MOV AL,DIG1     ;convert 1st digit to tens place
        MOV BL,10
        MUL BL
        MOV NUM2,AL     ;add 1st digit to 2nd digit
        MOV AL,DIG2
        ADD NUM2,AL

        
        MOV DX,OFFSET MSG3 
        MOV AH,09H
        int 21h 
        
        MOV AL, NUM1
        MOV BL, NUM2
        MUL BL   
              
        XOR DX,DX
        MOV BX,03E8H
        DIV BX
        

        
        PUSH DX
        MOV DL,AL
        ADD DL,30H
        MOV AH,02H
        INT 21H
        POP DX
    
        MOV ax,DX
        XOR DX,DX
        MOV BX,0064H
        div BX
       
        PUSH DX
        MOV DL,AL
        ADD DL,30H
        MOV AH,02H
        INT 21H
        POP DX

        MOV AX,DX
        XOR DX,DX
        MOV BX,000AH
        div BX
      
        PUSH DX
        MOV DL,AL
        ADD DL,30H
        MOV AH,02H
        INT 21H
        POP DX


        MOV AL,DL
        PUSH DX
        MOV DL,AL
        ADD DL,30H
        MOV AH,02H
        INT 21H
        POP DX
        
        MOV ah, 4CH
        INT 21H
        
        ENDS
    END START
