data segment
        num1 dw 0123h
        num2 dw 1234h
        diff dw 0000h
        borrow db 00h
data ends
code segment
        assume cs:code,ds:data
        start:
                mov ax,data
                mov ds,ax
                clc
                mov ax,num1
                sub ax,num2
                mov diff,ax
                adc borrow,0
                mov ah,4ch
                int 21h
code ends
        end start
