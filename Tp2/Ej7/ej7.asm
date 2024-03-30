;Escribir un programa que dado un array de números enteros, 
;de 4 bytes, encuentre el menor, y lo imprima por salida estándar.

;en eax guardo siempre el menor

section .data
arr dd 5, 6, 2, 8, 9 ;defino mi array
length equ 5 ;dimension del array
end_line db 10, 0     ;salto de linea

section .bss
numstr resb 10 ;reservo la memoria


section .text
global _start
EXTERN print
EXTERN numtostrcat
EXTERN exit

_start:
  lea esi, [arr] ;uso esi porque es el mas comun que suele usarse para iterar sobre arrays.
  mov edx, length
  mov eax, [esi + ecx * 4]

.loop:
  cmp  [esi + ecx * 4], eax
  jb .aim
.below_loop:
  dec edx
  inc ecx
  cmp edx, 0
  jnz .loop
  jmp .finish

.aim: ;assign if minor funcion hecha solo para asignar cuando sea menor
  mov eax, [esi + ecx * 4]
  jmp .below_loop

.finish:
  push numstr
  push eax
  call numtostrcat
  mov ebx, end_line
  call print

.end:
  mov ebx, 0
  call exit
 

;.check:
   
