section .text
global _start
extern numtostr
extern exit
extern getmax

_start:
; push eax
; push ebx
; push ecx
; push edx
; mov eax, [array]
; mov ecx, longitud - 1
; mov edx, 1

; ciclo:
; cmp edx, longitud
; je end

; mov ebx, [array + edx*4]
; cmp ebx, eax
; jle next
; mov eax, ebx
; next:
; inc edx
; dec ecx
; jmp ciclo

; end:
; push placeholder
; push eax
; call numtostr
; add esp, 8
; pop edx
; pop ecx
; pop ebx
; pop eax

;
push array
push longitud
call getmax
push placeholder
push eax
call numtostr
add esp, 8
call exit

section .data
;Declaring int values array with 4 bytes size each, and the length in 4 bytes register size
array dd 12, 22, 152, 55, 90, 15, 2, 0
longitud equ ($ - array) / 4

section .bss
placeholder resb 64