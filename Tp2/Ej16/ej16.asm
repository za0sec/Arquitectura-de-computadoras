
section .data
end_line db 10, 0
simon dd "Simon Says: ", 0

section .bss
res resb 100

section .text
global _start
EXTERN print
EXTERN exit
EXTERN to_upper


_start:

  mov eax, 0x3
  mov ebx, 0 ;STANDARD INPUT
  mov ecx, res
  mov edx, 100
  int 0x80

  mov ebx, simon
  call print 

  mov ebx, ecx
  call to_upper
  mov ebx, res
  call print


.end:
  mov ebx, 0
  call exit
