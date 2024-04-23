#include <stdio.h>

#define ARRMAX 20

void noInit(){
  int a[ARRMAX]; //Supongo que reserva 20x4 + 24  espacios sin escribir
}

void init(){
  int a[ARRMAX] = {0}; //Reserva 20x4 espacios 
}

void noInitWrite(){
  int a[ARRMAX];

  a[10] = 5;
}

void initWrite(){
  int a[ARRMAX] = {0};

  a[10] = 5;
}

global1[ARRMAX];

global2[ARRMAX] = {0};





