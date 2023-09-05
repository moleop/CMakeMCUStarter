#include <sys/types.h>
#include <sys/stat.h>

// _exit
void _exit(int status) {
    (void)status;
    while(1) { }
}

// _close
int _close(int file) {
    return -1;  // error
}

// _lseek
int _lseek(int file, int ptr, int dir) {
    return 0;  // stub
}

// _read
ssize_t _read(int file, char *ptr, ssize_t len) {
    return 0;  // stub
}

// _write
ssize_t _write(int file, char *ptr, ssize_t len) {
    // For now, let's say we don't support any file writing, 
    // but if you're writing to something like a UART for debug, you'd place that here.
    return len;  // pretend we wrote everything
}

// _sbrk
extern char _end;  // defined by the linker
static char *heap_end = &_end;

char *_sbrk(int incr) {
    char *prev_heap_end = heap_end;
    heap_end += incr;
    return prev_heap_end;
}
