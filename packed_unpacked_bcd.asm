dosseg
model small
.8086

.code
mov ax, 4000h
mov ds, ax
mov al, [2000h]
and al, 0fh
mov [2001h], al
mov al, [2000h]
and al, 0f0h
mov cl, 04h
rol al, cl
mov [2002h], al
int 03H
end
