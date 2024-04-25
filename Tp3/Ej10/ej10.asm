section .data
vendor db '            ', 0 

section .text
global _start

_start:

    xor eax, eax 
    cpuid       


    mov [vendor], ebx    ; Primeros 4 caracteres
    mov [vendor+4], edx  ; prox 4 car
    mov [vendor+8], ecx  ; ultimos 4 caracteres

    mov eax, 4        
    mov ebx, 1       
    mov ecx, vendor  
    mov edx, 12     
    int 0x80

    mov eax, 1      
    xor ebx, ebx   
    int 0x80      
