data segment
        num1 db 99h
        num2 db 99h
        sum db 00h
        carry db 00h
data ends
code segment
        assume cs:code,ds:data
        start:
                mov ax,data
                mov ds,ax
                clc
                mov al,num1
                add al,num2
                daa 
                mov sum,al
                adc carry,0
                mov ah,4ch
                int 21h
code ends
        end start
