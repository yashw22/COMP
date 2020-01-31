data segment
        num1 dw 0044h
        num2 dw 0044h
        res dd 0
data ends
code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov ax,0
        mov dx,0
        mov cx,num2
up:
        add ax,num1
        adc dx,0
        clc
loop up
        lea si,res
        mov [si],ax
        mov [si+2],dx
        mov ah,4ch
        int 21h
code ends
end start
                
