section .text
GLOBAL sys_write 
GLOBAL sys_read
GLOBAL sys_open
GLOBAL sys_close

sys_write: 
    push ebp 
    mov ebp, esp 
    push ebx           
    mov eax, 0x4 
    mov ebx, [ebp+8]  ; fd 
    mov ecx, [ebp+12] ; buffer 
    mov edx, [ebp+16] ; length 
    int 0x80 
    pop ebx
    mov esp, ebp
    pop ebp
    ret

sys_read:
    push ebp 
    mov ebp, esp 
    push ebx           
    mov eax, 0x3 
    mov ebx, [ebp+8]  ; fd 
    mov ecx, [ebp+12] ; buffer 
    mov edx, [ebp+16] ; length 
    int 0x80 
    pop ebx
    mov esp, ebp
    pop ebp
    ret

sys_open:
    push ebp
    mov ebp, esp
    push ebx
    mov eax, 0x5
    mov ebx, [ebp+8]    ; filename
    mov ecx, [ebp+12]   ; flags
    mov edx, 0644
    int 0x80
    pop ebx
    mov esp, ebp
    pop ebp
    ret

sys_close:
    push ebp
    mov ebp, esp
    push ebx
    mov eax, 0x6
    mov ebx, [ebp+8]    ; fd
    int 0x80
    pop ebx
    mov esp, ebp
    pop ebp
    ret
