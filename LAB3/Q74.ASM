data segment
        num1 dw 2222h
        num2 dw 4444h
        diff dw 0000h
        borrow db 00h
        count dw 0002h
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
                inc si
                inc di
                inc bx
        loop next
                adc borrow,0
                mov ah,4ch
                int 21h
code ends
        end start
