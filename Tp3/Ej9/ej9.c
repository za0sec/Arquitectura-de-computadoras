#include <fcntl.h>

#define STDIN 0
#define STDOUT 1
#define BUFFER_SIZE 1024


extern int sys_open(const char* filename, int flags); //El 3er argumento, son los permisos.
extern int sys_close(int fd);
extern int sys_read(int fd, char * buffer, int len);
extern int sys_write(int fd, const char * string, int len);

int main(int argc, char * argv[]){



    char buffer[BUFFER_SIZE];
    int bytes_read;
    int line = 1;
    int i;

    int fileIn = sys_open("/home/tomas/shared/Tp3/Ej9/javi.txt", O_RDONLY);
    if (fileIn < 0) {
        return -1;
    }
  
    int fileOut = sys_open("/home/tomas/shared/Tp3/Ej9/out.txt", O_WRONLY | O_CREAT | O_TRUNC);
    if (fileOut < 0) {
        sys_close(fileIn);
        return -1;
    }

    char lineHeader[12];

    while ((bytes_read = sys_read(fileIn, buffer, BUFFER_SIZE)) > 0) {
      int start = 0;

      for (i = 0; i < bytes_read; i++) {
          if (buffer[i] == '\n' || i == bytes_read - 1) {
            
            int headerLength = 0;
            for (int num = line; num > 0; num /= 10) { headerLength++; }
            headerLength += 2; 
            int pos = headerLength - 3;
            for (int num = line; num > 0; num /= 10) {
              lineHeader[pos--] = (num % 10) + '0';
            }
            lineHeader[headerLength - 2] = ':';
            lineHeader[headerLength - 1] = ' ';
            lineHeader[headerLength] = '\0';

            sys_write(1, lineHeader, headerLength);
            sys_write(fileOut, lineHeader, headerLength);
              
            sys_write(1, buffer + start, i - start + 1);
            sys_write(fileOut, buffer + start, i - start + 1);
              
            start = i + 1;
            line++;
        }
      }
    }

    sys_close(fileIn);
    sys_close(fileOut);
    return 0;

}
