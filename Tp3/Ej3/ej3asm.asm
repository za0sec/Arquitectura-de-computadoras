GLOBAL pid

pid: 

  push ebp
  mov ebp, esp

  mov eax, 0x14
  int 0x80

  mov esp, ebp
  pop ebp
  ret
