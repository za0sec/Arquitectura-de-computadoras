# Diferencias?

[FUENTE](https://www.cs.uaf.edu/courses/cs301/2014-fall/notes/struct/)

## Pasar structs por copia implica:

1. Reservar espacio en el stack suficiente para almacenar todos los campos de la estructura.
2. Copiar cada campo de la estructura original a la nueva ubicacion en el stack.
3. Pasar la direccion de la nueva copia de la estructura al stack antes de realizar la llamada a la funcion.

El principal problema de este metodo es que puede ser ineficiente en tiempo y espacio, especialmente para estructuras grandes porque implica copiar todos los datos de la estructura.

## Pasar structs por direccion de memoria implica:

1. Obtener la direccion de la estructura original.
2. Pasar la direccion al stack como un argumento para la llamada de la funcion.

Este metodo es mucho más eficiente porque se evita la copia de datos.


# Aca muestro un ejemplos

## Ejemplo en C

```c

struct Data {
    int a;
    int b;
};

void func(struct Data* ptr) {
    ptr->a = 5;
    ptr->b = 10;
}

```

## Ejemplo en assembler

```c

section .data
  es db 0, 0, 0, 0, 0, 0, 0, 0 

section .text
global _start


_start:
  push offset es ;siendo 'es' un struct. Empuja la dirección de 'estructura' en el stack
  call modifyStruct
  add esp, 4        ;limpia stack despues de la func

modifyStruct:
  push ebp
  mov ebp, esp
  mov eax, [ebp+8]   ;eax ahora tiene la dirección de 'es'
  add [eax], 5      ; es.a += 5
  add [eax+4], 10   ;es.b += 10
  pop ebp
  ret           ;god

```
