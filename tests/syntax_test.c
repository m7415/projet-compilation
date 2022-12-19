#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "syntax_test.h"

// Inclure les en-têtes générés par Bison pour utiliser les fonctions de l'analyseur syntaxique
#include "../compil.tab.h"

extern int yyparse(void);
extern FILE *yyin;

int syntax_test() {

  // Ouvrir le fichier de test
  FILE *input_file = fopen("./tests/test1.txt", "r");
  if (input_file == NULL) {
    fprintf(stderr, "Error: unable to open input file test1.txt\n");
    return 1;
  }

  yyin = input_file;

  // Utiliser l'analyseur syntaxique pour analyser la chaîne
  int result = yyparse();

  // Check the result of the parse
  if (result == 0) {
    printf("Parse successful!\n");
  } else {
    printf("Parse failed.\n");
  }

  fclose(input_file);

  return result;
}