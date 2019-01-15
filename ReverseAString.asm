.MODEl small

.DATA 
    MSG1 DB 10,13,'ENTER ANY STRING :- $'
    MSG2 DB 10,13,'THE REVERSE STRING IS :- $'
    MSG3 DB 10,13,'PLEASE TRY AGAIN. ENTER A STRING NO LESS THAN TEN(10) $'
   
    P1 LABEL BYTE
    M1 DB 0FFH
    L1 DB ?
    P11 DB 0FFH DUP ('$')
    P22 DB 0FFH DUP ('$')
      
.CODE
    START:    
        MOV AX,@DATA
        MOV DS,AX                
                   
        MOV AH,9
        LEA DX,MSG1
        INT 21H
       
        LEA DX,P1
        MOV AH,0AH    
        INT 21H
               
        MOV AH,9
        LEA DX,MSG2
        INT 21H
               
        LEA SI,P11
        LEA DI,P22
       
        MOV DL,L1
        DEC DL
        MOV DH,0
        ADD SI,DX
        MOV CL,L1
        MOV CH,0
         
    REVERSE:
        MOV AL,[SI]
        MOV [DI],AL
        INC DI
        DEC SI
        LOOP REVERSE
       
        MOV AH,9
        LEA DX,P22
        INT 21H
                      
        LEA SI,P11
        LEA DI,P22   
       
        MOV CL,L1
        MOV CH,0
        
        MOV AH,4CH
        INT 21H
END START

