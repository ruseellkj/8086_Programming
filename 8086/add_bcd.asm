Program to add two 16-bit bcd numbers

dosseg
model small
.8086

;data segment
.data
a dw 1234H
b dw 5140H
sum dw ?
carry db 00H

;code segment 
.code
mov ax, @data
mov ds, ax
mov ax, a
mov bx, b
add al, bl
daa
mov al, ah
adc al, bh
daa
jnc skip
mov carry, 01H
skip : mov sum, ax
int 03H
end
