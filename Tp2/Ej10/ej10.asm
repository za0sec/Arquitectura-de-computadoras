
section .data
end_line db 10, 0
start_line db "La cantidad de argumentos es: ", 0

section .bss
numstr resb 10

section .text
GLOBAL _start
EXTERN print
EXTERN numtostrcat
EXTERN exit

_start:
  mov ebp, esp
  mov edx, [ebp]

  mov ebx, start_line     ; Imprimo la cantidad de argumentos
  call print
  mov ebx, edx
  push numstr
  push ebx
  call numtostrcat             
  mov ebx, end_line
  call print

  mov ecx, 0 ;pongo contador

.finish:
  cmp ecx, edx            ; Si ecx es mayor, me voy
  jge .end
  mov ebx, [ebp + ecx * 4 + 8]
  push ebx
  call print
  mov ebx, end_line
  call print
  inc ecx
  jmp .finish

.end:
  mov ebx, 0
  call exit

