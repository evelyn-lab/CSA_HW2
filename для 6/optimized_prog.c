#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* fill_from_console(int* n) {
   scanf("%d ", n);
   char *a = (char*)malloc((*n) * sizeof(char));
   register int i asm ("r12");
   for(i = 0; i < *n; i++) {
      scanf("%c", &a[i]);
   }
   return a;
}
void* print_string(char *a, int n) {
   register int i asm ("r12");
   for (i = 0; i < n; i++) {
      printf("%c", a[i]);
   }
   printf("\n");
}
void* difference(char *a, int n1, char *b, int n2) {
    char *buffer = (char*)malloc((n1) * sizeof(char)); 
    int current_size = 0;
    register int i asm ("r12"); 
    for (i = 0; i < n1; i++) {
      if (strchr(b, a[i]) == NULL && strchr(buffer, a[i]) == NULL) {
          buffer[current_size] = a[i];
          ++current_size;
      }
   }
   register char *result asm("r13") = (char*)malloc((current_size) * sizeof(char)); 
   for (i = 0; i < current_size; i++) {
      result[i] = buffer[i];
   }
   free(buffer);
   print_string(result, current_size);
}

int main(int argc, char** argv) {
   int n1, n2, n3;
   register char *str1 asm("r14") = fill_from_console(&n1);
   register char *str2 asm("r15") = fill_from_console(&n2);
   difference(str1, n1, str2, n2);
   difference(str2, n2, str1, n1);
   free(str1); 
   free(str2);
   return 0;
}
