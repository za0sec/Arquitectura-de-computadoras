#include <stdlib.h>

int operar(char* n1, char* n2, char *operador){
    int num1 = atoi(n1);
    int num2 = atoi(n2);
    
    switch(operador[0]){
        case '+':
            return num1 + num2;
        case '*':
            return num1 * num2;
        case '/':
            return num1 / num2;
        case '^':
            return num1 * num2;
        default:
            return 0;
    }
}
