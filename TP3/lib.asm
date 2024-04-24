

;Tengo que agregar menor en array (es solo cambiar el jump)
; order array


;===============================================================================
; Imprime todos los argumentos con los que se ejecuta el programa.
;===============================================================================


GLOBAL print
GLOBAL exit
GLOBAL numtostr
GLOBAL memstringwrite
GLOBAL carr_ret
GLOBAL printarray
GLOBAL getpid
GLOBAL caps
GLOBAL getmax

section .text

;===============================================================================
; print - imprimer una cadena en la salida estandar
;===============================================================================
; Argumentos:
;	ebx: cadena a imprimer en pantalla, terminada con 0
;===============================================================================
print:
	pushad		; hago backup de los registros

	call strlen
	mov ecx, ebx	; la cadena esta en ebx
	mov edx, eax	; en eax viene el largo de la cadena

	mov ebx, 1	; FileDescriptor (STDOUT)
	mov eax, 4	; ID del Syscall WRITE
	int 80h
	
	popad 		; restauro los registros
	ret	

	
;===============================================================================
; exit - termina el programa
;===============================================================================
; Argumentos:
;	ebx: valor de retorno al sistema operativo
;===============================================================================
exit:
	mov eax, 1	; ID del Syscall EXIT
	int 80h	; Ejecucion de la llamada


;===============================================================================
; strlen - calcula la longitud de una cadena terminada con 0
;===============================================================================
; Argumentos:
;	ebx: puntero a la cadena
; Retorno:
;	eax: largo de la cadena
;===============================================================================
strlen:
	push ecx ; preservo ecx	
	push ebx ; preservo ebx
	pushf	; preservo los flags

	mov ecx, 0	; inicializo el contador en 0
.loop:			; etiqueta local a strlen
	mov al, [ebx] 	; traigo al registo AL el valor apuntado por ebx
	cmp al, 0	; lo comparo con 0 o NULL
	jz .fin 	; Si es cero, termino.
	inc ecx		; Incremento el contador
	inc ebx
	jmp .loop
.fin:				; etiqueta local a strlen
	mov eax, ecx	
	
	popf
	pop ebx ; restauro ebx	
	pop ecx ; restauro ecx
	ret


;===============================================================================
; numtostr - convierte un entero en un string guardandolo en 
; el stack
;===============================================================================
; Argumentos:
;	el numero entero de 32 bit que se recibe en el stack
; ESP +4 a convertir
; Retorno:
;	los caracteres ASCII en el stack se devuelven  
; Atencion:
;   Luego de llamarla se debe limpiar los argumentos pusheados, la subrutina 
;   no lo hace sola (add esp, 8)
;===============================================================================

numtostr:
	mov ebp,esp ; guardo el puntero del stack
	pushad	
	MOV ECX,10
	MOV EDX,0   ; Pongo en cero la parte mas significativa
	Mov EAX, dword[EBp +4]  ;Cargo el numero a convertir
	MOV EBX,dword[ebp +8]
	ADD EBX,9               ; me posiciono al final del string para empezar a colocar
	mov byte [ebx], 0       ; los caracteres ASCII de derecha a izquierda comenzando con cero
	dec ebx                 ; binario
.sigo	
	DIV ECX
	OR Dl, 0x30  ; convierto el resto  menor a 10 a ASCII
	mov byte [ebx], Dl  
	DEC EBX      ; si el cociente es mayor a 0 sigo dividiendo
	cmp al,0
	jz .termino
	mov edx,0
	jmp .sigo
.termino
	inc ebx
	call print
    call carr_ret
	POPAD
	mov esp,ebp	 
	ret




;===============================================================================
; memstringwrite
;===============================================================================
; Argumentos:
;	ebx: puntero a la cadena terminada en 0
;	eax: puntero a donde se quiere almacenar
;===============================================================================

memstringwrite:
    ;Guardo el stack pointer, los registros y las flags
    mov ebp, esp
    push ebx
    push eax
    push edx
    push ecx
    mov edx, 0

.ciclo
    ;Si llegue al final del string -> salgo
    cmp byte[ebx], 0
    jz .salida
    ;Escribo el byte del puntero con lo que haya en el string
    mov byte ecx, [ebx]
    mov [eax], ecx
    ;sigo recorriendo tanto el string como la memoria
    add eax, 1
    add ebx, 1
    add edx, 1
    ;repito xq no llegue al final
    jmp .ciclo

.salida
    mov byte [eax], 0
    sub eax, edx
    sub ebx, edx
    pop edx

    pop eax
    pop ebx
    mov esp, ebp
    ret

;===============================================================================
; carr_ret
;===============================================================================
; Imprime salto de linea y vuelve el carry al inicio de esta 
;===============================================================================

carr_ret:
push ebx
mov ebx, carry_ret_string
call print
pop ebx
ret

;===============================================================================
; printarray
;===============================================================================
; Imprime un array de ints de 4 bytes size
; Argumentos: 
;       Primero pushear direc del array y luego su longitud
;===============================================================================

printarray:
mov ebp, esp
push eax
push ebx
push ecx
push edx

mov edx, 0
mov eax, [ebp + 8];direcc del array
mov ebx, [ebp + 4];longitud

printarray_ciclo:
cmp edx, ebx
jz printarray_end

mov ecx, [eax + 4*edx]
push ebp
push placeholder
push ecx
call numtostr
mov ebp, [esp + 8]
inc edx

jmp printarray_ciclo

printarray_end:
mov esp, ebp
mov edx, [esp - 4]
mov ecx, [esp - 8]
mov ebx, [esp - 12]
mov eax, [esp -16]
ret

;===============================================================================
; getpid
;===============================================================================
; No Arguments needed
; Returns in eax the pid
; 
;===============================================================================

getpid:
mov eax, 20
int 80h
ret


;===============================================================================
; caps
;===============================================================================
; Arguments:
;       ebx: char* where string starts
; Return:
;       ebx: the same char* transformed
;===============================================================================

caps:
; Saving the first position in the string
push ebx

caps_ciclo:
; If the string ends -> get out of the cycle
cmp byte [ebx], 0
je end

; Check if its a minus letter
cmp byte [ebx], 97
jl next
cmp byte [ebx], 122
jg next
; Transforming into mayusc the minusc
sub byte [ebx], offset
next:
inc ebx
jmp caps_ciclo

end:
pop ebx
ret

;===============================================================================
; getmax
;===============================================================================
; Arguments:
;       First push the array direction, and then the length
; Return:
;       eax: The maxinum value
;===============================================================================
getmax:
push ebp
mov ebp, esp
push ebx
push ecx
push edx
mov eax, [ebp + 12]
mov eax, [eax]
dec dword[ebp + 8]
mov ecx, [ebp + 8]  
mov edx, 1

getmax_ciclo:
cmp dword edx, [ebp + 8]
je getmax_end

mov dword ebx, [ebp + 12]               ; Lo llevo al principio del array
mov ebx, [ebx + edx*4]                  ; Lo desplazo hasta la posicion a leer
cmp ebx, eax
jle getmax_next
mov eax, ebx
getmax_next:
inc edx
dec ecx
jmp getmax_ciclo

getmax_end:
pop edx
pop ecx
pop ebx
mov esp, ebp
pop ebp
ret




section .data
carry_ret_string db 10, 0
offset equ 'a' - 'A'

section .bss
placeholder resb 64


