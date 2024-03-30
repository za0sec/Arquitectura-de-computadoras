GLOBAL print
GLOBAL exit
GLOBAL numtostrcat
GLOBAL to_upper
section .text

;-----------------------------------------------------------
; print - imprimer una cadena en la salida estandar
;-----------------------------------------------------------
; Argumentos:
;	ebx: cadena a imprimir en pantalla, terminada con 0
;-----------------------------------------------------------
print:
	pushad		; hago backup de los registros

	call strlen
	mov ecx, ebx	; la cadena esta en ebx
	mov edx, eax	; en eax viene el largo de la cadena

	mov ebx, 1		; FileDescriptor (STDOUT)
	mov eax, 4		; ID del Syscall WRITE
	int 80h
	
	popad 			; restauro los registros
	ret	
	
;-----------------------------------------------------------
; exit - termina el programa
;-----------------------------------------------------------
; Argumentos:
;	ebx: valor de retorno al sistema operativo
;-----------------------------------------------------------
exit:
	mov eax, 1		; ID del Syscall EXIT
	int 80h			; Ejecucion de la llamada


;-----------------------------------------------------------
; strlen - calcula la longitud de una cadena terminada con 0
;-----------------------------------------------------------
; Argumentos:
;	ebx: puntero a la cadena
; Retorno:
;	eax: largo de la cadena
;-----------------------------------------------------------
strlen:
	push ecx 		; preservo ecx	
	push ebx 		; preservo ebx
	pushf			; preservo los flags

	mov ecx, 0		; inicializo el contador en 0
.loop:				; etiqueta local a strlen
	mov al, [ebx] 	; traigo al registo AL el valor apuntado por ebx
	cmp al, 0		; lo comparo con 0 o NULL
	jz .fin 		; Si es cero, termino.
	inc ecx			; Incremento el contador
	inc ebx	
	jmp .loop
.fin:				; etiqueta local a strlen
	mov eax, ecx	
	
	popf
	pop ebx ; restauro ebx	
	pop ecx ; restauro ecx
	ret

;-----------------------------------------------------------
; numtostrcat - convierte un entero en un string guardandolo en 
; el stack (32 bits)
;-----------------------------------------------------------
; Argumentos:
;	el numero entero de 32 bit que se recibe en el stack
;   ESP +4 a convertir 
; Retorno:
;	los caracteres ASCII en el stack se devuelven  
;-----------------------------------------------------------
numtostrcat:
	
	mov ebp,esp 			; guardo el puntero del stack
	pushad	
	MOV ECX,10
	MOV EDX,0   			; Pongo en cero la parte mas significativa
	Mov EAX, dword[EBp +4]  ;Cargo el numero a convertir
	MOV EBX,dword[ebp +8]
	ADD EBX,9               ; me posiciono al final del string para empezar a colocar
	mov byte [ebx], 0       ; los caracteres ASCII de derecha a izquierda comenzando con cero
	dec ebx                 ; binario
.sigo	DIV ECX
	OR Dl, 0x30  			; convierto el resto  menor a 10 a ASCII
	mov byte [ebx], Dl  
	DEC EBX     			; si el cociente es mayor a 0 sigo dividiendo
	cmp al,0
	jz .termino
	mov edx,0
	jmp .sigo
.termino inc ebx
	 call print
   POPAD
	 mov esp,ebp	 
	 ret

;-----------------------------------------------------------
; to_upper - modifica un string pasandolo a mayuscula
;-----------------------------------------------------------
; Argumentos:
;	ebx: direccion del string
; Retorno:
;	No retorna nada  
;-----------------------------------------------------------

to_upper:
	pushad 						; Hago backup de los registros
	pushf						; Preservo los flags
.loop:
	cmp byte [ebx], 0 			; Me fijo si termine de recorrer el string	
    je .end 					
    cmp byte [ebx], lower_bound ; Comparo lo que tengo en [ebx] contra 'a'
    jl .end_loop
    cmp byte [ebx], upper_bound ; Comparo lo que tengo en [ebx] contra 'z'
    jg .end_loop
    sub byte [ebx], epsilon     ; Si no salte, hago la resta para pasar a mayuscula.
.end_loop:
    inc  ebx					; Incremento la direccion de memoria
    jmp .loop					; Vuelvo a iterar
.end:
	popad						; Restauro los registros
	popf						; Restauro los flags
    ret

section .data
epsilon equ 'a' - 'A'
lower_bound equ 'a'
upper_bound equ 'z'
