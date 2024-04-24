section .text
global _start
extern print
extern exit
extern numtostr

_start:
push ebx
push eax
push ebx
push ecx
push edx
mov eax, 1
mov ebx, k
mov ecx, n
mov edx, 0

ciclo: 
cmp eax, ebx
jnle end

push eax
mul dword ecx

;
push placeholder
push eax
call numtostr
;
mov eax, [esp + 8]
inc eax

jmp ciclo

end:
pop edx
pop ecx
pop ebx
pop eax
call exit


section .data
n equ 4
k equ 12
carr_ret db 10, 0


section .bss
placeholder resb 64