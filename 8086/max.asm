dosseg
model small
.8086

;100 numbers starting from 42000 physical address

.code
       mov ax, 4000h
       mov ds, ax
       mov si, 2000h
       mov cx, 000ah ;count of 100d
       mov al , 00H
back : cmp al , [si]
       jnc skip
       mov al, [si]
skip : inc si
       loop back
       mov [si], al
       int 03h
end