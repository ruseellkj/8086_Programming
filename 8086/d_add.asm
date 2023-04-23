dosseg
model small
.8086


.data
        MSGH1 db 0DH, 0AH, " $"
        MSG1 db 0AH,0DH, "please enter the numbers: ... $"
        MSG2 db 0AH,0DH ": $"
        MSG3 db 0AH,0DH,0AH,0DH, "grand total: $"

        ARRN DB 06 DUP (?)
        LEN DB 06H
        GT DW 0000H

.code 
        MOV AX, @data ;initialise data segment
        MOV DS, AX

        MOV AH, 09H ; to display the msg1 and ask for the numbers
        LEA DX, MSG1
        INT 21H

        ;getting the series of numbers
        LEA SI, ARRN
        MOV CL, LEN
        MOV BL, 01H ;used for writing 1: 2: 3: in the display


BACK1:  MOV AH, 09H ;to get the space (return new line)
        LEA DX, MSGH1
        INT 21H
        MOV AH, 02H ;to get numbers 1 2 3 4 before the actual number
        MOV DL, AL
        ADD DL, 30H ;write in ascii 
        INT 21H
        INC BL ;to inc number from 1 to 2 to 3 to 4....
        MOV AH, 09H
        LEA DX, MSG2
        INT 21H 

        CALL BAGET8
        MOV [SI], AL
        INC SI
        DEC CL
        JNZ BACK1


CALC:   LEA SI, ARRN ; Calculate total (main prgm)
        MOV CL, LEN
        MOV AX, GT

BACK2:  ADD AL, [SI]
        DAA
        JNC SKP2
        MOV BH, AL
        MOV AL, AH
        ADD AL, 01H
        DAA
        MOV AH, AL
        MOV AL, BH
SKP2:   INC SI
        DEC CL
        JNZ BACK2
        MOV GT, AX
        


        MOV AH, 09H ;to display grand total
        LEA DX, MSG3
        INT 21H
        LEA SI, GT
        INC SI
        CALL BAPUT8
        DEC SI
        CALL BAPUT8



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
P1:     MOV AH, 02H
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



        MOV AH, 4CH ; End the program... go back to dos
        INT 21H
END

