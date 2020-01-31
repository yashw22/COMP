data segment
        num1 dw 0ffffh
        num2 dw 0fffeh
        sum dw 0000h
        carry db 00h
data ends
code segment
        assume cs:code,ds:data
        start:
                mov ax,data
                mov ds,ax
                clc
                mov ax,num1
                add ax,num2
                adc carry,0
                mov sum,ax
                mov ah,4ch
                int 21h
code ends
        end start
