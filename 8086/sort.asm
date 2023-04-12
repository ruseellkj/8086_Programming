dosseg
model small
.8086

.code
mov ax, 4000H
mov ds, ax
mov ch, 09H ;outer-loop count
back2:  mov cl, 09H ;inner-loop count
        mov si, 2000H ;pointer
back1:  mov al, [si]
        mov ah, [si+1]
        cmp al, ah
        jc skip
        jz skip
        ;we are sorting in increasing manner
        ;swapping the numbers if the prev num > current num
        mov [si+1], al
        mov [si], ah
skip:   inc si
        dec cl
        jnz back1
        dec ch
        jnz back2
        int 03H
        end
