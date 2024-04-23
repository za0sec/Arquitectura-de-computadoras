section .text
GLOBAL _start

EXTERN main


_start:
    mov ebp, esp
    mov eax, ebp

    add eax, 4      ;me muevo a la posicion del primer arg
    push eax        ;lo pusheo
    mov eax, [ebp]  ;ahora pongo en eax la cantidad de args
    push eax        ;lo pusheo
    
    call main       ;main busca y retorna argc
    mov ebx, eax    ;pongo lo que retorno en ebx
    
    mov eax, 1      ;lo imprimo :)
    int 80h;        ;para fijarse hay que hacer un 'echo $?' (osea, imprimir el codigo de retorno de la llamada anterior).
