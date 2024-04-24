section .text
global _start
extern numtostr
extern exit
extern printarray
extern getmax

_start:
; push ebp
; mov ebp, esp
push eax
push ebx
push ecx
push edx
mov dword [current], 0
mov eax, 0                      ; eax points the first value of the array
mov edx, 0                      ; edx is i in array[i] 
mov ecx, 0                      ; ecx stores the last maxinum value
mov ebx, 0                      ; ebx is array[i] in the stage
                                ; and is the pass (or stage) outside it
push array
push longitud
call getmax                     ; Pre saving the max value to eax
mov [array], eax
add esp, 8
mov ecx, eax
mov eax, dword[array]

ciclo_externo:
cmp dword ebx, longitud * 4
je end
mov ebx, 0

ciclo_interno:                  ; This cycle finds the stage maxinum value
cmp edx, longitud 
je end_interno

mov ebx, [array + edx*4]
cmp ebx, eax                    ; The previous max is greater or equals -> ignore the value
jle next
cmp ebx, ecx                    ; The value is bigger or equals to the maxinum from the previous pass
jge next                        ; then the value is already in the new array
mov eax, ebx
next:
inc edx

jmp ciclo_interno

end_interno:
mov ebx, [current]
mov dword[new_array + ebx], eax
add ebx, 4
mov  [current], ebx
mov ecx, eax                    ; Saving the stage maxinum value for the next comparison
mov edx, 0                      ; Resetting index
; Test
; push placeholder
; push eax
; call numtostr
; add esp, 8
;
mov eax, 0                ;resetting the max stage value
jmp ciclo_externo


end:
push new_array
push longitud
call printarray
pop edx
pop ecx
pop ebx
pop eax
; pop ebp
; mov esp, ebp

call exit

section .data
;Declaring int values array with 4 bytes size each, and the length in 4 bytes register size
; Array must initialize in 0, but value will not be considered
array dd 00, 12, 22, 152, 55, 90, 15, 2, 0
longitud equ ($ - array) / 4
; current equ 0
section .bss
current resd 4
placeholder resb 64
new_array resw 4*longitud