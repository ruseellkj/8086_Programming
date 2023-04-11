dosseg
model small
.8086
100 numbers starting from 42000

.code
mov ax, 4000h
mov ds, ax
mov si, 2000h
mov cx, 0064h
mov al , 00H
back : cmp al , [si]
       jnc skip
       mov al, [si]
skip : inc si
       loop back
mov [si], al
int 03H
end