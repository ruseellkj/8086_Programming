dosseg
model small
.8086

.data
msg1 db "please enter the first number: $" 
;here the $ symbol denotes the end of the string
msg2 db "please enter the second number: $"
msg3 db "sum: $"
msg4 db "carry: $"



a db ?
b db ? 
sum db ?
carry db 00H




.code



