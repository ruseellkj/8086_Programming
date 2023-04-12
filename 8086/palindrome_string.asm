dosseg
model small
.8086

.data
string1 db 25H,34H,63H,77H,63H,34H,25H
pal db 00H

.extra
string2 db 07H dup (?)

.code
mov ax, @data
mov ds, ax
mov ax, @extra
mov es, ax
lea si, string1 ;or mov si, offset string1
lea di, string2+06H
mov cx, 0007H
back:   cld
        lodsb 
        std
        stosb
        loop back

        lea si, string1
        lea di, string2
        mov cx, 0007H
        cld
   repe cmpsb
        jnz skip
        inc pal
skip:   int 03H
        end

