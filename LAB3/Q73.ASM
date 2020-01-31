data segment
        num1 dd 88888888h
        num2 dd 22111111h
        sum dd 0
        carry db 0
        count dw 0004h
data ends
code segment
        assume cs:code,ds:data
        start:
                mov ax,data
                mov ds,ax
                mov cx,count
                lea di,num1
                lea si,num2
                lea bx,sum
                clc
        next:
                mov al,[di]
                adc al,[si]
                daa
                mov [bx],al
                inc di
                inc si
                inc bx
        loop next
                adc carry,0
                mov ah,4ch
                int 21h
code ends
        end start
