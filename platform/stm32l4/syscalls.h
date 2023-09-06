#include <sys/types.h>
#include <sys/stat.h>

// _exit
void _exit(int status);

// _close
int _close(int file);

// _lseek
int _lseek(int file, int ptr, int dir);
// _read
ssize_t _read(int file, char *ptr, ssize_t len);

// _write
ssize_t _write(int file, char *ptr, ssize_t len);

// _sbrk
extern char _end;  // defined by the linker
static char *heap_end = &_end;

char *_sbrk(int incr);
