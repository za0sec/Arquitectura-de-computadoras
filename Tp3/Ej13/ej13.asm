
section .data
  es db 0, 0, 0, 0, 0, 0, 0, 0  ; Reserva espacio para 'struct Data'

section .text
global _start


_start:
  push offset es ;siendo 'es' un struct
  call modifyStruct
  add esp, 4  ; limpiar el stack después de la llamada

modifyStruct:
  push ebp
  mov ebp, esp
  mov eax, [ebp+8]  ; eax ahora tiene la dirección de 'es'
  add [eax], 5      ; es.a += 5
  add [eax+4], 10   ; es.b += 10
  pop ebp
  ret
