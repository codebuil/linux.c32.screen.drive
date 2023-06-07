org 101000h
[bits 32]
head:
mov eax,0x21cd4cff
mov eax,20
mov ebx,10
call locate
mov edi,eax
mov ebx,hello
mov esi,ebx
mov al,17h
call memcopyb8000
mov ax,0
int 21h
ret
ret
memcopyb8000:
mov ebx,edi
mov edi,0b8000h
clc
add edi,ebx
push ds
mov bx,0
mov es,bx
mov ah,al
memcopyb80002:
es
mov al,[esi]
es
mov[edi],ax
inc esi
inc edi
inc edi
cmp al,0
jnz memcopyb80002
pop ds
ret
locate:
mov edx,0
mov ecx,0
push eax
push ebx
pop eax
mov ebx,160
clc
mul ebx
pop ebx
clc
add eax,ebx
clc
add eax,ebx
ret
checkin:
hello db "hello world.....",0

