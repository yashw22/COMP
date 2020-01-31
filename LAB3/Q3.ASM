data segment
        num1 dd 0fedcba98h
        num2 dd 0ffddccbbh
        sum dd 0
        carry db 0
        count dw 0002h
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
                mov ax,[di]
                adc ax,[si]
                mov [bx],ax
                inc di
                inc di
                inc si
                inc si
                inc bx
                inc bx
        loop next
                adc carry,0
                mov ah,4ch
                int 21h
code ends
        end start
