section data
new_line db 10,0
section .bss
numstr resb 10

section .text
GLOBAL _start
EXTERN print
EXTERN exit
EXTERN numtostrcat

_start: 
  mov ebx, 4

.loop:
    add esp, ebx
    push numstr
    push ebx
    
    call numtostrcat
    add ebx, 4
    
    push ebx  
    mov ebx, new_line 
    call print 
    
    pop ebx
    jmp .loop


