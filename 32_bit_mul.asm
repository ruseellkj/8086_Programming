dosseg
model small
.8086

.code
mov ax, 2000h
mov ds, ax
mov si, 0000h
;take q and s in ax and bx registers
mov ax, [si]
mov bx, [si+04h]
mul bx
mov [si+08h], ax
mov [si+0ah], bx
;take p and r in ax and bx registers
mov ax, [si+02h]
mov bx, [si+06h]
mul bx
mov [si+0ch], ax
mov [si+0eh], bx
;take p and s in ax and bx registers
mov ax, [si+02h]
mov bx, [si+06h]
mul bx
add ax, [si+0ah]
mov [si+0ah], ax
adc dx, [si+0ch]
mov [si+0ch] , dx
mov ax, 0000h
adc ax, [si+0eh]
mov [si+0eh], ax
;take q and r in ax and bx register
mov ax, [si]
mov bx, [si+06h]
mul bx
add ax, [si+0ah]
mov [si+0ah]m, ax
adc dx, [si+0ch]
mov [si+0ch], dx
mov ax, 0000h
adc ax, [si+0eh]
mov [si+0eh], ax
int 03h
end
