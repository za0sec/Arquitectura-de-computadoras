;Dado un número n, imprimir su factorial. Tenga cuidado con los argumentos de la función.
;estoy en pilar y se corto la luz asi que nose si hay alguna funcion que sea MULT o algo asi. hago ciclo de sum.
section .data
fact equ 9
end_line db 10, 0

section .bss
numstr resb 100

section .text
global _start
EXTERN print
EXTERN numtostrcat
EXTERN exit

_start:
  mov eax, 1
  mov ecx, fact
  dec ecx

.fact:
  cmp ecx, 0
  mov ebx, eax
  jnz .mult
  jmp .finish

.finish:
  push numstr
  push eax
  call numtostrcat
  mov ebx, end_line
  call print
  mov ebx, 0

  call exit

.mult:
  add eax, ecx
  dec ebx
  cmp ebx, 0
  jnz .mult
  dec ecx
  ;mov eax, edx
  jmp .fact

