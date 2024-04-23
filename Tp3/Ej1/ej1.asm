GLOBAL main
EXTERN printf

section .rodata
fmtA db "argc: %d",10,  0
fmtB db "argv[%d] = %s", 10, 0

section .text
main:
	push ebp		
	mov	ebp,esp                 ; armado de stack frame
	push dword[ebp+8]		        ; cantidad de argumentos
	push fmtA
	call printf
	add	esp,2*4                 ; balanceo el stack
	mov	ecx, dword[ebp+8]       ; inicializo el counter con la cantidad de argumentos
	mov	ebx,0                   ; voy a usar ebx para hacer argv[ebx]
	mov	esi,[ebp+12]	          ; cargo la direccion del vector de chars 
	cld		                        ; autoincremento de ESI
.loop:
	lodsd                         ; eax = [ESI] y  ESI = ESI + 4. Cargo el primer elemento del vector de punteros.
	push ecx                     ; backup porque printf no preserva ecx
	push eax                     ; cargue en eax lo que tenia que imprimir (*argv)
	push ebx	                    ; indice
	push fmtB                    ; formato
	call printf
	add	esp,4*3                 ; borramos los datos usados de la pila
	pop	ecx                     ; recuperamos el valor de ecx antes de hacer el loop
	inc	ebx
	loop .loop                   ; decremento y comparo ecx con 0 y salto si ecx no vale 0
	mov	esp,ebp
	pop	ebp                     ; desarmado de stack frame
	mov	eax,0                   ; valor de retorno de main
	ret
