;42000 is the starting address

dosseg
model small
.8086

.code
mov ax, 4000h
mov ds, ax
mov si, 2000h
mov cx, 0064h
mov bl, 00H ;even counter
mov bh, 00H ;odd counter
back : mov al, [si]
       ror al, 1
       jc odd
       inc bl
       jmp next
odd :  inc bh
next : inc si
       loop back 
       mov [si], bx
int 03H
end




