extern void* print_string(char *a, int n, char* outpath);
void* difference(char *a, int n1, char *b, int n2, char* outpath) {
    char *buffer = (char*)malloc((n1 + n2) * sizeof(char)); 
    int current_size = 0;
    register int i asm ("r12"); 
    for (i = 0; i < n1; i++) {
      if (strchr(b, a[i]) == NULL && strchr(buffer, a[i]) == NULL) {
          buffer[current_size] = a[i];
          ++current_size;
      }
   }
  buffer[current_size] = '\n';
  ++current_size;
  for (i = 0; i < n2; i++) {
      if (strchr(a, b[i]) == NULL && strchr(buffer, b[i]) == NULL) {
          buffer[current_size] = b[i];
          ++current_size;
      }
   }
   register char *result asm("r13") = (char*)malloc((current_size) * sizeof(char)); 
   for (i = 0; i < current_size; i++) {
      result[i] = buffer[i];
   }
   free(buffer);
   print_string(result, current_size, outpath);
}
