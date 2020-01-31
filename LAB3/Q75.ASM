data segment
        num1 dd 22222222h
        num2 dd 44444444h
        diff dd 0
        borrow db 00h
        count dw 0004h
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
                mov al,[si]
                sbb al,[di]
                das
                mov [bx],al
                inc di
                inc si
                inc bx
        loop next
                adc borrow,0
                mov ah,4ch
                int 21h
code ends
        end start
