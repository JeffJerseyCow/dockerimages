#include <stdio.h>
#include <stdlib.h>

int
main(int argc, char **argv, char **envp)
{
  if(argc <= 1) {
    printf("Error: Please provide argument\n");
    return -1;
  }
  int v = atoi(argv[1]);
  if(v % 2 == 0)
    printf("Value is even\n");
  else
    printf("Value is odd\n");
  return 0;
}
