;Escribir un programa que ordene un array de números enteros, 
;de 4 bytes, e imprima el resultado ordenado por pantalla.


;PREGUNTAR PORQUE A VECES SE BUGUEA!!!


section .data
arr dd 10, 2, 3, 8, 5, 1, 0, 23, 14, 6, 9, 45, 41
length equ 13
end_line db 10, 0

section .bss
numstr resb 10 ;reservo la memoria


section .text
GLOBAL _start
EXTERN print
EXTERN numtostrcat
EXTERN exit

_start:
  lea esi, [arr]
  mov ecx, 0
  mov ebx, 0
  mov eax, [esi]
  
.loop:
  mov edx, length
  cmp ecx, edx
  jz .finish

  cmp [esi + ecx * 4], eax
  jb .aim

.below_loop:
  inc ecx
  cmp edx, ecx
  jnz .loop
  dec edx
  cmp ebx, edx
  jz .finish
  jmp .continue
  
.aim: ;assign if minor funcion hecha solo para asignar cuando sea menor
  mov eax, [esi + ecx * 4]
  push ecx
  jmp .below_loop
  
.continue:
  pop ecx
  mov edx, [esi + ebx * 4]
  mov [esi + ecx * 4], edx
  mov [esi + ebx * 4], eax

  inc ebx
  mov eax, [esi + ebx * 4]
  mov ecx, ebx
  jmp .loop


.finish:
  mov ecx, 0
  jmp .print_arr

.print_one:
  inc ecx

.print_arr:
  push numstr
  mov eax, [esi + ecx * 4]
  push eax
  call numtostrcat
  mov ebx, end_line
  call print
  cmp ecx, edx
  jnz .print_one

.end:
  mov ebx, 0
  call exit
 




