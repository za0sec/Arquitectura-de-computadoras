
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
  mov eax, [ebp]
  dec eax        ;mayor legibilidad

  mov ebx, start_line     ; Imprimo la cantidad de argumentos
  call print
  mov ebx, eax
  push ebp     ;pusheo porque la funcion numtostrcat me mueve ebp
  push numstr
  push ebx
  call numtostrcat
  add esp, 4*2 ;Como pushie otras cosas necesito volver esp
  pop ebp ;agarro ebp del stack
  mov ebx, end_line
  call print

  mov ecx, 0 ;pongo contador

.finish:
  cmp ecx, eax            ; Si ecx es mayor, me voy
  jge .end
  mov ebx, [ebp + ecx*4 + 8] ;por la formula dada
  call print
  mov ebx, end_line
  call print
  inc ecx               ;incremento contador
  jmp .finish

.end:
  mov ebx, 0
  call exit

