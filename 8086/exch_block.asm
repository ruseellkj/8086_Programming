exchanging the data or block
here we need another block 
25000 36000 and 48000

dosseg
model small
.8086

.code
mov ax, 2000h
mov ds, ax
mov ax, 4000h
mov es, ax
mov si, 5000h
mov di, 8000h
mov cx, 0400h
cld
rep movsb
mov ax, 3000h
mov ds, ax
mov ax, 2000h
mov es, ax
mov si, 6000h
mov di, 5000h
mov cx, 0400h
cld
rep movsb
mov ax, 4000h
mov ds, ax
mov ax, 3000h
mov es, ax
mov si, 8000h
mov di, 6000h
mov cx, 0400h
cld
rep movsb
int 03H
end
