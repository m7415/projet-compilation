#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "syntax_test.h"
#include "quads.h"
// Inclure les en-têtes générés par Bison pour utiliser les fonctions de l'analyseur syntaxique
#include "compil.yy.h"
#include "compil.tab.h"


#define NB_TESTS 2
#define MAX_BUFFER_SIZE 1024

int syntax_test() {
  int passed = 0;

  char * namefile = malloc(MAX_BUFFER_SIZE * sizeof(namefile));

  for (size_t i = 0; i < NB_TESTS; i++)
  {
    sprintf(namefile,"./tests/test%ld.txt",i);
    // Ouvrir le fichier de test
    yyin = fopen(namefile, "r");
    if (yyin == NULL) {
      fprintf(stderr, "Error: unable to open input file test%ld.txt\n",i);
      return 1;
    }
    /* char c;
    while((c=fgetc(yyin))!=EOF){
        printf("%c",c);
    } */

    // Utiliser l'analyseur syntaxique pour analyser la chaîne
    int result = yyparse();

    // Check the result of the parse
    if (result == 0) {
      printf("L'analyse numero %ld à réussie !\n",i);
    } else {
      printf("L'analyse numero %ld à échoué.\n",i);
      passed = 1;
    }

  }
  fclose(yyin);
  free(namefile);

  return passed;
}