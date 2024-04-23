#include <assert.h>
int puts(const char* str);

int main(){
    int ans = puts("Hola putito\n");
    assert(ans == 12);
    return 0;
}
