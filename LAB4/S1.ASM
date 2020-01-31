data segment
        num1 db 22h
        num2 db 44h
        res dw 0
data ends
code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov al,num1
        mov ah,num2
        mul ah
        mov res,ax
        mov ah,4ch
        int 21h
code ends
end start
