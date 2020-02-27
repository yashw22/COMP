display macro var
    lea dx,var
    mov ah,09h
int 21h
endm

data segment
msg  db  'Enter a character: $'
msg1 db  13,10,'Entered character without echo: '
in1  db   ?,13,10,'$'
msg2 db  13,10,'Entered character with echo: '
in2  db   ?,13,10,'$'
data ends

code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax

display msg
mov ah,01h
int 21h
mov byte ptr in2,al
display msg2

display msg
mov ah,08h
int 21h
mov byte ptr in1,al
display msg1

mov ah,4ch
int 21h
code ends
end start

