data segment
        arr db 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
        sum db 00h
        carry db 00h
        count dw 000ah
data ends
code segment
        assume cs:code,ds:data
        start:
                mov ax,data
                mov ds,ax
                lea si,arr
                mov cx,count
                mov al,0
                mov ah,0
        next:
                clc
                add al,[si]
                adc ah,0
                inc si
        loop next
                mov sum,al
                mov carry,ah
                mov ah,4ch
                int 21h
code ends
        end start
