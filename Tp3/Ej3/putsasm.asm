GLOBAL sys_write

ALIGN 4

sys_write:
  push ebp
  mov ebp, esp

  push ebx

  mov eax, 0x4
  mov ebx, [ebp+8]
  mov ecx, [ebp+12]
  mov edx, [ebp+16]
  int 0x80

  pop ebx

  mov esp, ebp
  pop ebp
  ret
