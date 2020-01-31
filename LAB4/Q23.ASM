data segment
        num1 dd 00002222h
        num2 dw 1111h
        quo dw 0
        rem dw 0
data ends
code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        lea si,num1
        mov ax,[si]
        mov dx,[si+2]
        div num2
        mov quo,ax
        mov rem,dx
        mov ah,4ch
        int 21h
code ends
end start
