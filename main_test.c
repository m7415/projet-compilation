#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

// Inclure les en-têtes de tous les tests
#include "./tests/lexical_test.h"
#include "./tests/syntax_test.h"

// gcc -g -Wall -Wextra ./obj/compil.tab.o main_test.c ./tests/lexical_test.c ./tests/syntax_test.c -o main_test


// Définir une structure pour enregistrer les résultats de chaque test
typedef struct test_result {
  char* test_name;
  int passed;
} test_result_t;

// Définir un tableau pour stocker les résultats de tous les tests
test_result_t test_results[100];
int test_count = 0;

// Définir une fonction de rappel pour enregistrer les résultats des tests
void test_callback(char* test_name, int passed) {
  test_results[test_count].test_name = test_name;
  test_results[test_count].passed = passed;
  test_count++;
}

int main() {
  // Exécuter tous les tests
  lexical_test();
  syntax_test();

  // Afficher les résultats de tous les tests
  printf("Rapport de test:\n");
  for (int i = 0; i < test_count; i++) {
    printf("- %s: %s\n", test_results[i].test_name, test_results[i].passed ? "passé" : "échoué");
  }

  return 0;
}