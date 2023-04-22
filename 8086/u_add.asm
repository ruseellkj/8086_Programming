dosseg
model small
.8086

.data
        MSG1 db 0DH, 0AH, "please enter the first number: $" 
        MSG2 db 0DH, 0AH, "please enter the second number: $"
        MSG3 db 0DH, 0AH, "sum: $"
        MSG4 db 0DH, 0AH, "carry: $"

        A DB ?
        B DB ?
        SUM DB ?
        CARRY DB 00H

.code
        MOV AX, @data ;initialise ds
        MOV DS, AX

        MOV AH, 09H ;display headers and ask for the 1st number
        LEA DX, MSG1
        INT 21H
        CALL BAGET8
        MOV A, AL

        MOV AH, 09H ;display headers and ask for the 2nd number 
        LEA DX, MSG2
        INT 21H
        CALL BAGET8
        MOV B, AL

        ;main logic of the program
        MOV AL, A ;take first number
        ADD AL, B
        JNC SKIP
        INC CARRY
SKIP:   MOV SUM, AL

        MOV AH, 09H ;display sum
        LEA DX, MSG3
        INT 21H
        LEA SI, SUM
        CALL BAPUT8

        MOV AH, 09H ;display carry
        LEA DX, MSG4
        INT 21H
        LEA SI, CARRY
        CALL BAPUT8

        MOV AH, 4CH ;end the program.... go back to dos
        INT 21H

;subroutine that will be called when we want to write and want to see it
PROC    BAGET8 ;gets an 8-bit number
        PUSH CX
        MOV AH, 01H ;to get a single charac (HIGHER NIBBLE) from user and that will come in AL everytime
        INT 21H
        SUB AL, 30H
        CMP AL, 09H
        JLE G1
        SUB AL, 07H
G1:     MOV CL, 04H ;rotating the higher nibble
        ROL AL, CL
        MOV CH, AL 

        MOV AH, 01H
        INT 21H
        SUB AL, 30H
        CMP AL, 09H
        JLE G2
        SUB AL, 07H 
G2:     ADD AL,CH ;no need to rotate the lower nibble returns the number in al
        POP CX

        RET 
ENDP    BAGET8

;from variable sum display the number on screen
PROC    BAPUT8
        PUSH CX
        MOV AL, [SI]
        AND AL, 0F0H
        MOV CL, 04H
        ROL AL, CL
        ADD AL, 30H
        CMP AL, 39H
        JLE P1
        ADD AL, 07H
PI:     MOV AH, 02H
        MOV DL, AL
        INT 21H

        MOV AL, [SI]
        AND AL, 0FH
        ADD AL, 30H
        CMP AL, 39H
        JLE P2
        ADD AL, 07H
P2:     MOV AH, 02H
        MOV DL, AL
        INT 21H
        POP CX

        RET
ENDP    BAPUT8


