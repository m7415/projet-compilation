#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

// Inclure les en-têtes de tous les tests
#include "./tests/lexical_test.h"
#include "./tests/syntax_test.h"
#include "./tests/quads_test.h"

// gcc -g -Wall -Wextra ./obj/compil.tab.o ./tests/lexical_test.c ./tests/syntax_test.c main_test.c -o main_tests


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
  printf("Lancement des tests :\n");
  // Exécuter tous les tests
  printf("Test 1 : analyseur lexical\n");
  if(lexical_test() == 0){
    printf("Passed !\n");
  }else{
    //
  }

  printf("Test 2 : analyseur syntaxique\n");
  if(syntax_test() == 0){
    printf("Passed !\n");
  }else{
    //
  }

  printf("Test 3 : quads (bidon, à suppr, mais pour tester le makefile en fait)\n");
  if(quads_test() == 0){
    printf("Passed !\n");
  }else{
    //
  }

  // Afficher les résultats de tous les tests
  printf("Rapport de test:\n");
  for (int i = 0; i < test_count; i++) {
    printf("- %s: %s\n", test_results[i].test_name, test_results[i].passed ? "passé" : "échoué");
  }

  return 0;
}