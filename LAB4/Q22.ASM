data segment
        num1 dw 0025h
        num2 db 4
        quo db 0
        rem db 0
data ends
code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov ax,num1
        idiv num2
        mov quo,al
        mov rem,ah
        mov ah,4ch
        int 21h
code ends
end start
