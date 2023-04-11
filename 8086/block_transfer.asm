Program to transfer 1KB from 25000 to 36000 
25000 and 36000 is the physical address 
25000 = 2000x10+5000
36000 = 3000x10+6000

1KB = (1024)d so covert it to hexadecimal 
1024 = 0400h remember
if we are using movsw then the count needs to be reduced to half (even)


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
mov cx, 0400h
cld
rep movsb
int 03H
end


