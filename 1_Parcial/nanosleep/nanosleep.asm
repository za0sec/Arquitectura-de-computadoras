section .data
  sec dd 1,0
  filename db "/path"
  advice db "SE ENCONTRO"
  arreglo dd 10, 20, 30, 40, 50
  cant_arreglo dd ($-arreglo)/4


ALIGN 4

section .text
global _start

_start:
  
  push ebp
  mov ebp, esp

 .loop:
    mov eax, 0xa2
    mov ebx, sec
    mov ecx, 0
    int 0x80

    push filename
    push 16
    call get_humedad
    add esp, 4*2
    
    mov ebx, 7
    div ebx
      
    mov ecx, dword[cant_arreglo]

    mov ebx, eax
    cld
    mov esi, arreglo
    lodsd

    .check_array:
      cmp ecx, 0
      jz .loop
      

      cmp eax, ebx
      jz .found
      
      dec ecx

      jmp .check_array

      .found:
        push advice
        call print

        jmp .loop 

