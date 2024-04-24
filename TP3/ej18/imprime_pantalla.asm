extern copy_to_memory
;supongo esta funcion existey necesita los parametros:
;eax = adress,  ebx = string adress,  acx = string length
;Lo supongo asi porque debe haber un syscall que no conozco que trabaja similar a sys_write
;O incluso con un codigo de fil
global imprime_pantalla
section .text

;recibi (enc, tam enc, pie, tam pie)
imprime_pantalla:
push ebp            ;armo stack frame
mov ebp, esp
push ebx            ;preservo ebx
push ecx            ;preservo ecx

mov eax, A0000000h  ;me paro en la primera fila
mov dword ebx, [ebp+4]
mov dword ecx, [ebp+8]
call copy_to_memory ;me devuelve la pila inalterada
                    ;ahora en la ultima
mov eax, A0000000h + (5 * 80)
mov dword ebx, [ebp+12]
mov dword ecx, [ebp+16]
call copy_to_memory

mov ecx, [ebp-8]
mov ebx, [ebp-4]
leave
ret

;Podria en vez de llamar a un syscall, llamar a una funcion, para la cual deberia pushear los argumentos de derecha
;a izquierda y que esta escriba en memoria. Le re pusheo todo para integridad de los datos pero no creo que sea
;la idea dado que acomplejiza la situacion cuando hay un syscall que es seguro y te ahorra esto