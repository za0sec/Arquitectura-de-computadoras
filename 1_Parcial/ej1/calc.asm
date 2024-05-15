section .data
    errormsg db "mal pasaje de parametros %s",10,0
    okmsg db "el resultado es: %d",10,0


section .text
    GLOBAL main
    extern printf
    extern operar
    extern puts


main:
    push ebp
    mov ebp, esp
    push eax
    push ebx
    push ecx
    push edx


    mov edx, [ebp + 12] ;*argv

    ;[edx] es la direccion al primer argumento (path) char*
    ;[edx + 4] es la direccion al segundo argumento (n1) char*
    ;[edx + 8] es la direccion al tercer argumento (operando) char*
    ;[edx + 12] es la direccion al cuarto argumento (n2) char*

    mov ebx, [edx + 8]
    movzx ecx, byte[ebx] ;en ecx tengo el ascii, pues desreferencie la direccion.

    cmp ecx, '*'
    je .ok
    cmp ecx, '^'
    je .ok
    cmp ecx, '+'
    je .ok
    cmp ecx, '/'
    je .ok
    jmp .error

    .error:
        push DWORD[edx + 8] ;operando fallido
        push errormsg
        call printf
        add esp,8
        jmp .fin

    .ok:
        push ebx
        push DWORD[edx + 12]
        push DWORD[edx + 4]
        call operar
        add esp, 12

        push eax;paso el numero
        push okmsg;paso el string
        call printf
        add esp,8


    .fin:
        add esp,4
        pop edx
        pop ecx
        pop ebx
        pop eax
        mov esp, ebp
        pop ebp
        ret
