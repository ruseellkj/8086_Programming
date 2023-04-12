dosseg
model small
.8086

;data
.data
array db 02H,06H,07H,09H,01H
smaller db 00H

;code
.code
mov ax,@data
mov ds, ax
;setting the counter register with a count of 5
mov cx, 0005H
mov si, offset array
mov al, [si]
;moving the content of si to the al register 
dec cx
;decrementing the counter register
cmp al, [si]
;comparing the content in al with the content of si after increasing it
jc next
mov al, [si]
next : loop up
mov smaller, al
;after traversing through the loop and finding the smallest num
;moving the smallest num from al to smaller variable 
int 03H
end
