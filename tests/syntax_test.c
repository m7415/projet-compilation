#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "syntax_test.h"
#include "quads.h"
// Inclure les en-têtes générés par Bison pour utiliser les fonctions de l'analyseur syntaxique
#include "compil.yy.h"
#include "compil.tab.h"


#define NB_TESTS 16
#define MAX_BUFFER_SIZE 1024

int syntax_test() {
  char *filenames[NB_TESTS] = {
    "./tests/in/test_arithm_cond.sh",
    "./tests/in/test_calculs.sh",
    "./tests/in/test_cond.sh",
    "./tests/in/test_elif.sh",
    "./tests/in/test_empty.sh",
    "./tests/in/test_for.sh",
    "./tests/in/test_func.sh",
    "./tests/in/test_str_cond.sh",
    "./tests/in/test_tab.sh",
    "./tests/in/test_until.sh",
    "./tests/in/test_while.sh",
    "./tests/in/test0.sh",
    "./tests/in/test1.sh",
    "./tests/in/test2.sh",
    "./tests/in/test3.sh",
    "./tests/in/test4.sh"
  };

  int passed = 0;

  for (size_t i = 0; i < NB_TESTS; i++)
  {
    // Ouvrir le fichier de test
    yyin = fopen(filenames[i], "r");
    if (yyin == NULL) {
      fprintf(stderr, "Error: unable to open input file %s\n",filenames[i]);
      return 1;
    }
    /* char c;
    while((c=fgetc(yyin))!=EOF){
        printf("%c",c);
    } */

    // Utiliser l'analyseur syntaxique pour analyser la chaîne
    int result = yyparse();
    yyrestart(yyin);

    // Check the result of the parse
    if (result == 0) {
      printf("L'analyse numero %ld à réussie !\n",i);
    } else {
      printf("L'analyse numero %ld à échoué.\n",i);
      passed = 1;
    }

  }
  fclose(yyin);

  return passed;
}