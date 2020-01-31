data segment
        num1 dt 22222222222222222222h
        num2 dt 44444444444444444444h
        diff dt 0
        borrow db 00h
        count dw 000ah
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
