display macro var
    lea dx,var
    mov ah,09h
    int 21h
endm

data segment
msg1 db  'Enter 1st 2 digit hex number: $'
msg2 db   13,10,'Enter 2nd 2 digit hex number: $'
num  db   3,?,3 dup (?)
msg  db   13,10,'Sum of entered number is '
sum  db   30h,?,?,'$'
n1   db   ?
data ends

code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax

display msg1
lea dx, num
mov ah,0ah
int 21h
mov al,byte ptr num+2
call ascii_hex
mov ah,al
mov al,byte ptr num+3
call ascii_hex
mov cl,04h
shl ah,cl
add al,ah
mov n1,al

display msg2
lea dx,num
mov ah,0ah
int 21h
mov al,byte ptr num+2
call ascii_hex
mov ah,al
mov al,byte ptr num+3
call ascii_hex
mov cl,04h
shl ah,cl
add al,ah

add al,n1
adc byte ptr sum,0
mov ah,al
and al,0f0h
mov cl,04h
shr al,cl
call hex_ascii
mov byte ptr sum+1,al
mov al,ah
and al,0fh
call hex_ascii
mov byte ptr sum+2,al

display msg

mov ah,4ch
int 21h

ascii_hex proc
    cmp al,41h
    jb dwn1
    sub al,07h
    dwn1:sub al,30h
    ret
ascii_hex endp

hex_ascii proc
    cmp al,0ah
    jb dwn2
    add al,07h
    dwn2:add al,30h
    ret
hex_ascii endp

code ends
end start

