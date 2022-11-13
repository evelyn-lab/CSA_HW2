extern void* difference(char *a, int n1, char *b, int n2, char* outpath);
void* fill_from_file(char* inpath, char* outpath) {
   int n1, n2;
   char trash;
   FILE *input;
   register int i asm ("r12");
   input = fopen(inpath, "r");
   fscanf(input, "%d", &n1);
   fscanf(input, "%c", &trash);
   register char *str1 asm("r14") = (char*)malloc((n1) * sizeof(char));
   for (i = 0; i < n1; i++) {
      fscanf(input, "%c", &str1[i]);
   }
   fscanf(input, "%d", &n2);
   fscanf(input, "%c", &trash);
   register char *str2 asm("r15") = (char*)malloc((n2) * sizeof(char));
   for (i = 0; i < n2; i++) {
      fscanf(input, "%c", &str2[i]);
   }
   difference(str1, n1, str2, n2, outpath);
   free(str1); 
   free(str2);
}
