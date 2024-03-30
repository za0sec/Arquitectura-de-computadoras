;Agregar a la biblioteca una función que recibe un número y una zona de memoria,
;y transforme el número en un string, terminado con cero, en la zona de memoria pasada como parámetro. 
 
section .data 
my_number dd 100 ; Carga el entero 100 como un double word (dato de 4 bytes) 
 
section .bss
 number_string resb 100 
  
section .text 
  
GLOBAL _start
  
_start:
    push ebp
    mov ebp, esp
    
push number_string

;;================================================================
;;===============================================
;;push my_number;; en el stack tenes la direccion de memoria donde buscar el numero --->>
;; te lo voy a cambiar por pushear al numero mismo, para que funcione.
push dword[my_number]
;;==========================================================
call number_to_str 

;;======================================================
add esp, 0x4 ; Descarto el puntero a number_string 
;; descartaste el ultimo pusheado, o sea, my_number, correcto lo hiciste
;;================================================================
call print

mov eax, 1 ; SYSCALL EXIT 
int 0x80 ;EBP = EBP ANTERIOR



      ;EBP + 0x4 = direccion de ret (main) 
      ;EBP + 0x8 = direccion del numero a transformar 
      ;EBP + 0xc = direccion donde escribir la string 
      ; Recibe un entero y una direccion de memoria. Deja en la direccion de memoria una string
      ; representando dicho numero, null-terminated. 
       
;;===================================
number_to_str:
push ebp 
mov ebp, esp

;prueba a ver si anda: creo que hacer [ebp+0x12] esta mal
         
mov ecx, [ebp + 0xc] ; Cargo en ECX el puntero a donde escribir la string 

mov ebx, 10 ; Cargo en EBX el divisor (el resto de dividir por 10 es el ultimo digito del numero) 

;;================================================================
;;================================================================
push DWORD [ebp + 0x8] ; Pusheo al stack el DIVIDENDO, el numero que me pasaron ;TODO estoy pusheando solo el puntero al numero debo modificar todo 
;; aca estaba "parte" del error. En el stack habias pusheado la direccion de memoria donde buscar al numero.
;; y si no cambiabas eso, aqui estabas pusheando el contenido del stack, que lo que tiene es una direccion de memoria ("my number") --> y recien adentro de my_number tenes el nro
          
ciclo: 
xor edx, edx ; Llena EDX con ceros antes de la división (pues DIV toma EDX y EAX como un unico entero) 
pop eax ; Cargo en EAX el numero (el actual) 
div ebx ; Divide EAX por EBX, cociente en EAX, resto en EDX
add edx, '0' ; Le sumo al digito el ascii del 0 (en EDX esta el resto de la division) ; No necesito hacer byte[ecx] pues al hacer dl ya sabe que esta agarrando un dato de un byte

mov [ecx], dl ;dl contiene los 8 bits menos significativos de edx Escribo en el puntero de la string el ascii del digito actual TODO va byte o algo asi?
inc ecx ; Apunto el ECX al siguiente espacio de memoria

;;================================================================
;;================================================================
;; ojo que lo que estas haciendo es poner el numero al reves:
  ;; si my_number = 123
  ;; en memoria te quedó 321

push eax ; Pusheo al stack el nuevo dividendo (el numero sin el digito que acabo de sacarle) 
              
test eax, eax 
jnz ciclo
              
terminar:
mov byte [ecx], 0
leave 
ret ;EBP - 0x8 = En este espacio se va guardando cada caracter en mayuscula 
    
    
;EBP - 0x4 = En este espacio se va guardando el puntero al char actual
;EBP = EBP anterior
;EBP + 0x4 = ret (main)
;EBP + 0x8 = direccion de my_string COMIENZO
; Imprime en pantalla la string que recibe por argumento en el stack. ; Lee hasta encontrar un 00 (NULL-TERMINATED). 


;;==================================================
print:
push ebp 
mov ebp, esp 
mov ecx, [ebp+0x8] ; Setea ECX al comienzo de la string 
; Seteo los registros para hacer WRITE 

mov ebx, 1 ; STANDARD OUTPUT 
mov edx, 1 ; Que lea 1 byte

putc: 
push ecx ; Guardo el puntero al char actual en ECX 

;;================================================================
;;================================================================
movzx eax, byte [ecx] ; Guardo en eax el primer char test al, al ; Setea ZF = 1 si el caracter actual es cero! (AL es el primer byte de ECX) 
;; está bueno tu algoritmo, pero aqui con movzx no setea los flags, porque esta instruc en particular no setea flags
;; hay que testear
cmp eax, 0

je terminar_print ; je salta si ZF = 1 (Si el char actual es cero se termina)
call to_upper_char ; El char en EAX ahora esta en mayuscula 
push eax ; Guardo en el stack el char en mayuscula 
mov ecx, esp ; Apunto ECX al char en mayuscula (para el SYSCALL) 

mov eax, 4 ; SYSCALL WRITE 
int 0x80 
add esp, 0x4 ; Me deshago del caracter que guarde en memoria 

pop ecx ; Restaura ECX al char actual 
inc ecx ; Apunta ECX al siguiente char de la string
jmp putc ; es un do-while :) 

terminar_print:
mov eax, 10
push eax 
mov ecx, esp ; imprimir un newline! 
mov ebx, 1 ; STANDARD OUTPUT
mov edx, 1 ; Que lea 1 byte
mov eax, 4 ; SYSCALL WRITE 
int 0x80 
leave 
ret ; Convierte a mayuscula el char en el primer byte que haya en EAX, o lo deja como estaba 

;;=============================
to_upper_char:
push ebp
mov ebp, esp

cmp eax, 'a'
jl terminar_to_upper_char

cmp eax, 'z'
jg terminar_to_upper_char ; TODO Usar el equ y no magic number 

sub eax, 32 

terminar_to_upper_char:

leave
ret
