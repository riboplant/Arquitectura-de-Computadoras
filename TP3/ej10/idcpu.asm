GLOBAL idcpu

idcpu:
push ebp
mov eax, 0x0
;mov EAX, 80000000h
cpuid
mov info, ebx
mov (info+32), edx
mov (info+64), ecx

mov eax, 4
mov ebx, 1
mov ecx, info
mov edx, 96
int 80h

ret

section .data
info db 96
buffer db 96