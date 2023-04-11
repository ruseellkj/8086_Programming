same exchange program but now without using the string instruction
25000 and 36000h
but this is tremendously slower than the string instruction


dosseg
model small
.8086

.code
mov ax, 2000h
mov ds, ax
mov ax, 36000h
moc es, ax
mov si, 5000h
mov di, 6000h
mov cx, 0400h
back : mov al, ds:[si]
       mov ah, es:[di]
       mov es:[di], al
       mov ds:[si], ah
       inc si
       inc di
       loop back
int 03H
end


