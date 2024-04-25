	.file	"fibo.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"El fibonacci de %d es %d"
	.text
	.globl	main
	.type	main, @function
main:
	lea	ecx, 4[esp]
	and	esp, -16
	push	DWORD PTR -4[ecx]
	push	ebp
	mov	ebp, esp
	push	ebx
	push	ecx
	sub	esp, 16
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, ecx
	mov	eax, DWORD PTR 4[eax]
	add	eax, 4
	mov	eax, DWORD PTR [eax]
	movzx	eax, BYTE PTR [eax]
	movsx	eax, al
	sub	eax, 48
	mov	DWORD PTR -20[ebp], eax
	mov	eax, DWORD PTR -20[ebp]
	mov	DWORD PTR -16[ebp], eax
	sub	DWORD PTR -20[ebp], 1
	sub	esp, 12
	push	DWORD PTR -20[ebp]
	call	fibonacci
	add	esp, 16
	mov	DWORD PTR -12[ebp], eax
	sub	esp, 4
	push	DWORD PTR -12[ebp]
	push	DWORD PTR -16[ebp]
	lea	eax, .LC0@GOTOFF[ebx]
	push	eax
	call	printf@PLT
	add	esp, 16
	mov	eax, 0
	lea	esp, -8[ebp]
	pop	ecx
	pop	ebx
	pop	ebp
	lea	esp, -4[ecx]
	ret
	.size	main, .-main
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 4
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	cmp	DWORD PTR 8[ebp], 1
	jg	.L4
	mov	eax, DWORD PTR 8[ebp]
	jmp	.L5
.L4:
	mov	eax, DWORD PTR 8[ebp]
	sub	eax, 1
	sub	esp, 12
	push	eax
	call	fibonacci
	add	esp, 16
	mov	ebx, eax
	mov	eax, DWORD PTR 8[ebp]
	sub	eax, 2
	sub	esp, 12
	push	eax
	call	fibonacci
	add	esp, 16
	add	eax, ebx
.L5:
	mov	ebx, DWORD PTR -4[ebp]
	leave
	ret
	.size	fibonacci, .-fibonacci
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	mov	eax, DWORD PTR [esp]
	ret
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
	mov	ebx, DWORD PTR [esp]
	ret
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
