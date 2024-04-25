# Mi Suposicion

Tomo solo esta parte del codigo:

```c
int fibonacci(int n){

  if (n < 2){
    return n;
  }

  return fibonacci(n-1) + fibonacci(n-2);
}
```

Aca arranca la suposicion:

```c
fibonacci:
	push ebp
	mov	ebp, esp
	push ebx
	sub	esp, 4
	cmp	[ebp + 8], 1
	jg	.part2
	mov	eax, [ebp + 8]
	jmp	.exit

.part2:
	mov	eax, [ebp + 8]
	sub	eax, 1
	sub	esp, 12
	push eax

    call fibonacci
	
    add	esp, 16
	mov	ebx, eax
	mov	eax, [ebp + 8]
	sub	eax, 2
	sub	esp, 12
	push eax
	call fibonacci
	add	esp, 16
	add	eax, ebx

.exit:
	mov	ebx, [ebp - 4]
	leave
	ret

```

