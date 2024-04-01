
section .data
seconds dd 2, 0

end_line db 10, 0
zz dd "zzzzzzzzz.......", 0
finished dd "Im Awake! :)", 0

section .text
global _start
EXTERN print
EXTERN exit


_start:
  
  mov ebx, zz
  call print
  mov ebx, end_line
  call print
  mov eax, 0xa2
  mov ebx, seconds
  mov ecx, 0

  int 0x80
  mov ebx, finished
  call print
  mov ebx, end_line
  call print

.end:
  mov ebx, 0
  call exit
