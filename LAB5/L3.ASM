data segment
hex dw 5678h
bcd dd 0
rem dw 5 dup (0)
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
mov bx,000ah
lea si,rem
mov ax,hex
mov dx,00h

up: mov dx,0
div bx
mov [si],dx
inc si
inc si
cmp ax,0
jnz up

lea si,rem
mov cl,04h
mov ax,[si+6]
shl ax,cl
add ax,[si+4]
shl ax,cl
add ax,[si+2]
shl ax,cl
add ax,[si]

lea di,bcd
mov [di],ax
mov ax,[si+8]
mov [di+2],ax

mov ah,4ch
int 21h
code ends
end start
