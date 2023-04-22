;Program to add two 16-bit numbers in 8086/asm


dosseg
model small
.8086

.data
a dw 9384H
b dw 1845H
sum dw ?
carry db 00H

.code
        mov ax, @data
        mov ds, ax
        mov ax, a
        add ax ,b
        jnc skip
        inc carry
skip :  mov sum, ax
        int 03H
end