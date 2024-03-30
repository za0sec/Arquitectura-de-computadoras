.data
hello_string db 'Hello world!', 10   ;   Almacena los bytes de la cadena seguidos por 0x10 (salto de linea)
len equ $-hello_string               ;   equ es como un DEFINE. Reemplaza la cadena len por el resultado de la cuenta

.text
global _start
_start:
mov eax, 4      ;   SYSCALL WRITE
mov ebx, 1      ;   STANDARD OUTPUT
mov ecx, hello_string
mov edx, len     ;   Que lea [len] bytes
int 0x80

mov eax, 1      ;   SYSCALL EXIT
int 0x80
