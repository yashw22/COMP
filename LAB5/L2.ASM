data segment
hex db 56h
bcd dw 0
rem db 3 dup (0)
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
mov bl,0ah
lea si,rem
mov al,hex

up: mov ah,0
div bl
mov [si],ah
inc si
cmp al,0
jnz up

lea si,rem
mov cl,04h
mov al,[si+1]
shl al,cl
add al,[si]
mov ah,[si+2]
mov bcd,ax

mov ah,4ch
int 21h
code ends
end start
