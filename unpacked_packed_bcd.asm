 suppose the number is 49
 so its unpacked bcd form is 09 and 04
 42000H ans
 42001H 09H
 42002H 004H

 dosseg
 model small
 .8086

 .code
 mov ax, 4000h
 mov ds, ax
 mov al, [2002h]
 mov cl, 04h
 rol al, cl
 add al, [2001h]
 mov [2000h], al
 int 03H
 end
