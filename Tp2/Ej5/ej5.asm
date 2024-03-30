;Dado un número n y un valor k, imprimir todos los valores múltiplos de n desde 1 hasta k.

section .data
num_first equ 7
num_to equ 50
end_line db 10, 0     

section .bss
numresb resb 10

section .text
global _start
EXTERN print
EXTERN numtostrcat
EXTERN exit


_start:
  mov ebx, num_first
  mov ecx, ebx

.multiple:
  xor edx, edx    ; Limpia EDX para evitar desbordamiento

  cmp ecx, num_to ;si es 0 JUMP .end
  je .end

  mov eax, ecx 
  div ebx
  cmp edx, 0
  je .to_stack

.below_stack:
  inc ecx
  jmp .multiple

.to_stack:
  push numresb 
  push ecx
  call numtostrcat
  mov ebx, end_line
  call print
  mov ebx, num_first
  jmp .below_stack

.end:
  mov ebx, 0

  call exit
