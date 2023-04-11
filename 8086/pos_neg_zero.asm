starting from 42000 address

dosseg
model small
.8086

.code
mov ax, 4000h
mov ds, ax
mov si, 2000h
mov cx, 0064h
mov bl, 00H ;pos counter
mov bh, 00H ;neg counter
mov dl, 00H ;zero counter
back :     mov al, [si]
           add al , 00H
           jz zero
           rol al, 01H
           jc negative
           inc bl
           jmp next
negative : inc bh
           jmp next
zero :     inc dl
next :     inc si
           loop back
           mov [si], bx
           mov [si], dl
           int 03h 
           end













