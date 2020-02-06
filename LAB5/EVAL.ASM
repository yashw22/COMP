data segment
arr2 dw 1111h,2222h,3333h,4444h,5555h
arr1 dw 2222h,3333h,4444h,5555h,6666h
res db 15 dup (0)
count dw 0005h
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
lea si,arr1
lea di,arr2
lea bx,res
mov cx,count

five:
clc
mov dl,0
mov al,[si]
sub al,[di]
das
mov [bx],al
inc si
inc di
inc bx
mov al,[si]
sbb al,[di]
das
mov [bx],al
inc bx
adc dl,0
mov [bx],dl
inc si
inc di
inc bx
loop five

mov ah,4ch
int 21h
code ends
end start
