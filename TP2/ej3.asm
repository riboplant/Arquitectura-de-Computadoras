section .text
global _start
extern print
extern exit
extern numtostr
extern memstringwrite


_start:

mov ebp, esp
mov ebx, num

push placeholder
push ebx
call numtostr
mov ebx, [esp + 4]
add ebx, 6
;Hasta aca se que converti num a str y tengo ese str iniciando en ebx
mov eax, target
call memstringwrite
mov ebx, target
call print
call exit

;------------------------------------------------------------------------------------------------
section .data
num equ 123

;-----------------------------------------------------------------------------------------------
section .bss
placeholder resb 32
target resb 64