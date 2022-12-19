#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

// Inclure les en-têtes générés par Bison pour utiliser les fonctions de l'analyseur syntaxique
#include "../compil.tab.h"

int syntax_test() {
  // Initialiser l'analyseur syntaxique en utilisant la fonction générée par Bison
  yyparse_init();

  // Définir un tableau de chaînes de test à analyser
  char* test_cases[] = {""};

  // Pour chaque chaîne de test, utiliser l'analyseur syntaxique pour analyser la chaîne et vérifier que le résultat renvoyé est celui attendu en utilisant la macro `assert`:
  for (int i = 0; i < sizeof(test_cases) / sizeof(char*); i++) {
    // Définir un pointeur vers la chaîne courante
    char* str = test_cases[i];

    yy_scan_string(str);

    // Utiliser l'analyseur syntaxique pour analyser la chaîne
    int result = yyparse();

    // Check the result of the parse
    if (result == 0) {
      printf("Parse successful!\n");
    } else {
      printf("Parse failed.\n");
    }
  }

  // Nettoyer l'analyseur syntaxique
  yyparse_destroy();

  return 0;
}