#include <stdio.h>

int fibonacci(int n);

int main(int argc, char * argv[]){

  int n = *(argv[1]) - '0';
  int n2 = n;
  n--;
  int num = fibonacci(n);
  printf("El fibonacci de %d es %d", n2, num);
  
  return 0;
}

int fibonacci(int n){

  if (n < 2){
    return n;
  }

  return fibonacci(n-1) + fibonacci(n-2);

}

