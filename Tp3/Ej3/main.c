#define STDOUT 1 

int sys_write(int fd, void *buffer, int size); 

int _strlen(const char * str){
    int i=0;
    while( *(str + (i++)) );
    return i-1;
}

int puts(const char* str) { 
    int len = _strlen(str); 
    return sys_write(STDOUT, (void *) str, len); 
}
