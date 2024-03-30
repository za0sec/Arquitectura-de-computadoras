;Dado un número n, imprimir la suma de los primeros n números naturales (No utilizaruna fórmula)

section .data
my_num equ 10
end_line db 10, 0     

section .bss
numstr resb 10  

section .text
global _start
EXTERN numtostrcat
EXTERN print
EXTERN exit

_start:

  mov ebx, my_num
  mov eax, 0

.sum:        ;este seria el ciclo

  add eax, ebx
  dec ebx
  test ebx, ebx
  jnz .sum   ;si es 0 va a finish

.finish:
  push numstr
  push eax
  call numtostrcat
  mov ebx, end_line
  call print
mov ebx, 0

  call exit

