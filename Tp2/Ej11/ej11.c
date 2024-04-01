#include <stdio.h>
#include <stdlib.h>

int main() {
    char* user = getenv("USER");
    if (user) {
        printf("Usuario actual: %s\n", user);
    } else {
        printf("La variable de entorno 'USER' no está definida.\n");
    }
    return 0;
}

