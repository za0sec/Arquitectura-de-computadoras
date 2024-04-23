//factorial.c 
int factorial(int n){   
  if (n == 0)
    return 1;   
  int factorial_n_1 = factorial(n-1);   
  return n*factorial_n_1; 
}
