	.file	"ej7.c"
	.intel_syntax noprefix
	.text
	.globl	noInit
	.type	noInit, @function
noInit:
	push	ebp
	mov	ebp, esp
	sub	esp, 104
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR -12[ebp], eax
	xor	eax, eax
	nop
	mov	eax, DWORD PTR -12[ebp]
	sub	eax, DWORD PTR gs:20
	je	.L2
	call	__stack_chk_fail_local
.L2:
	leave
	ret
	.size	noInit, .-noInit
	.globl	init
	.type	init, @function
init:
	push	ebp
	mov	ebp, esp
	push	edi
	sub	esp, 100
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR -12[ebp], eax
	xor	eax, eax
	lea	edx, -92[ebp]
	mov	eax, 0
	mov	ecx, 20
	mov	edi, edx
	rep stosd
	nop
	mov	eax, DWORD PTR -12[ebp]
	sub	eax, DWORD PTR gs:20
	je	.L4
	call	__stack_chk_fail_local
.L4:
	mov	edi, DWORD PTR -4[ebp]
	leave
	ret
	.size	init, .-init
	.globl	noInitWrite
	.type	noInitWrite, @function
noInitWrite:
	push	ebp
	mov	ebp, esp
	sub	esp, 104
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR -12[ebp], eax
	xor	eax, eax
	mov	DWORD PTR -52[ebp], 5
	nop
	mov	eax, DWORD PTR -12[ebp]
	sub	eax, DWORD PTR gs:20
	je	.L6
	call	__stack_chk_fail_local
.L6:
	leave
	ret
	.size	noInitWrite, .-noInitWrite
	.globl	initWrite
	.type	initWrite, @function
initWrite:
	push	ebp
	mov	ebp, esp
	push	edi
	sub	esp, 100
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR -12[ebp], eax
	xor	eax, eax
	lea	edx, -92[ebp]
	mov	eax, 0
	mov	ecx, 20
	mov	edi, edx
	rep stosd
	mov	DWORD PTR -52[ebp], 5
	nop
	mov	eax, DWORD PTR -12[ebp]
	sub	eax, DWORD PTR gs:20
	je	.L8
	call	__stack_chk_fail_local
.L8:
	mov	edi, DWORD PTR -4[ebp]
	leave
	ret
	.size	initWrite, .-initWrite
	.globl	global1
	.bss
	.align 32
	.type	global1, @object
	.size	global1, 80
global1:
	.zero	80
	.globl	global2
	.align 32
	.type	global2, @object
	.size	global2, 80
global2:
	.zero	80
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	mov	eax, DWORD PTR [esp]
	ret
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
