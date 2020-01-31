data segment
        num1 dw 2222h
        num2 dw -3
        res dd 0
data ends
code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov ax,num1
        mov bx,num2
        imul bx
        lea si,res
        mov [si],ax
        mov [si+2],dx
        mov ah,4ch
        int 21h
code ends
end start
