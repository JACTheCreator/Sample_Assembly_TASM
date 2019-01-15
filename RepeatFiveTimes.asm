;My name is repeated 5 times

.MODEL SMALL
.STACK 100H

.DATA
    MSG db 'Jermaine Coates',13,10,'$'
    COUNT db 4

.CODE 
    START:
        MOV AX, @DATA
        MOV DS, AX

        MOV AH, 9
        MOV DX, OFFSET MSG
        INT 21H

        MOV CL, COUNT
        DEC COUNT
        JNE START
        INT 21H

        MOV AH, 4CH
        INT 21H
    END START