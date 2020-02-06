data segment
bcd dw 3456h
hex dw ?
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax

mov ax,bcd
mov cl,0ch
shr ax,cl
mov cx,03e8h
mul cx
mov bx,ax

mov ax,bcd
mov cl,08h
shr ax,cl
and ax,000fh
mov cx,0064h
mul cx
add bx,ax

mov ax,bcd
mov cl,04h
shr ax,cl
and ax,000fh
mov cx,000ah
mul cx
add bx,ax

mov ax,bcd
and ax,000fh
add bx,ax

mov hex,bx
mov ah,4ch
int 21h
code ends
end start
