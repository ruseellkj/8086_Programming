Program to transfer 1KB from 25000 to 36000 
25000 and 36000 is the physical address 
25000 = 2000x10+5000
36000 = 3000x10+6000

dosseg
model small
.8086

.data
a dw 2000h
b dw 3000h
c dw 5000h
d dw 6000h

.code
mov ax,a
mov ds, ax
mox ax, b
mov es, ax
mov si, c
mov di, d
cld
rep movsb
int 03H
end


