data segment
        num1 dd 01234567h
        num2 dd 12345678h
        diff dd 0
        borrow db 00h
        count dw 0002
data ends
code segment
        assume cs:code,ds:data
        start:
                mov ax,data
                mov ds,ax
                clc
                lea si,num1
                lea di,num2
                lea bx,diff
                mov cx,count
        next:
                mov ax,[si]
                sbb ax,[di]
                mov [bx],ax
                inc di
                inc di
                inc si
                inc si
                inc bx
                inc bx
        loop next
                adc borrow,0
                mov ah,4ch
                int 21h
code ends
        end start
