section .data
end_line db 10,0

section .bss
numstr resb 10

section .text
GLOBAL _start
EXTERN print
EXTERN exit
EXTERN numtostrcat

_start: 
  mov eax, 0x14
  int 0x80
  push numstr
  push eax
  call numtostrcat
  mov ebx, end_line
  call print

.end:
  mov ebx, 0
  call exit

  

