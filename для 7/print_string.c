void* print_string(char *a, int n, char* outpath) {
  FILE *output;
  output = fopen(outpath, "w");
  for (int i = 0; i < n; i++) {
    fprintf(output, "%c", a[i]);
  }
}
