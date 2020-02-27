display macro var
    lea dx,var
    mov ah,09h
    int 21h
endm

data segment
msg1 db  'Enter 1st 2 digit decimal number: $'
msg2 db   13,10,'Enter 2nd 2 digit decimal number: $'
n1 db   3,?,3 dup (?)
n2 db   3,?,3 dup (?)
msg  db   13,10,'Sum of entered number is '
sum  db   3 dup (30h),'$'
data ends

code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax

display msg1
lea dx,n1
mov ah,0ah
int 21h

display msg2
lea dx,n2
mov ah,0ah
int 21h

mov ah,0
mov al,byte ptr n1+3
add al,byte ptr n2+3
aaa
mov bl,ah
add byte ptr sum+2,al

mov ah,0
mov al,byte ptr n1+2
add al,byte ptr n2+2
aaa
mov bl,ah
mov ah,0
add al,bl
aaa
add byte ptr sum+1,al
add bl,ah
add byte ptr sum,bl

display msg

mov ah,4ch
int 21h
code ends
end start

