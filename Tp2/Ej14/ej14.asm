section .data
child db "Soy el proceso hijo", 0
parent db "Soy el proceso padre", 0
end_line db 10, 0

section .text
global _start
EXTERN print
EXTERN exit


_start:
  mov eax, 0x2
  int 0x80   
    
  cmp eax, 0   ; Si EAX es 0, esta es la rama del child_process
  jz .child_process
  jmp .parent_process

.child_process: ;IF CHILD_PROCESS
  mov ebx, child
  call print
  mov ebx, end_line
  call print
  jmp .end
  
.parent_process: ;IF PARENT_PROCESS
  mov ebx, parent
  call print
  mov ebx, end_line
  call print
  jmp .end

.end:
  mov ebx, 0
  call exit

