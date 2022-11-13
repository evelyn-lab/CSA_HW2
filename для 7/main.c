#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern void* print_string(char *a, int n, char* outpath);
extern void* difference(char *a, int n1, char *b, int n2, char* outpath);
extern void* fill_from_file(char* inpath, char* outpath);
int main(int argc, char** argv) {
   fill_from_file(argv[1], argv[2]);
   return 0;
}
