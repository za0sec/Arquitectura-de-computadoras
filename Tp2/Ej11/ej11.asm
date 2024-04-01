section .text
GLOBAL _start
EXTERN print
EXTERN exit
_start:
    mov ebp, esp    ; Armo el stack frame
    mov eax, [ebp]  ; Cargo la cantidad de argumentos, tengo que recorrerlos todos y pararme en el null
    dec eax         
    mov ebx, [ebp + eax*4 + 80] ; en realidad seria "eax * 4 + 8 + 72" 72 = 18 * 4 para llegar a USER
    call print
    mov ebx, new_line
    call print
.end:
    mov ebx, 0
    call exit    
section .data
new_line db 10, 0
