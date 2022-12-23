#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

// Inclure les en-têtes de tous les tests
#include "./tests/lexical_test.h"
#include "./tests/syntax_test.h"
#include "./tests/quads_test.h"
#include "./tests/mips_test.h"


int main() {
  printf("Lancement des tests :\n");
  // Exécuter tous les tests
  printf("Test 1 : analyseur lexical\n");
  if(lexical_test() == 0){
    printf("Passed !\n");
  }else{
    //
  }

  printf("\nTest 2 : analyseur syntaxique\n");
  if(syntax_test() == 0){
    printf("Passed !\n");
  }else{
    //
  }

  printf("\nTest 3 : quads (bidon, à suppr, mais pour tester le makefile en fait)\n");
  if(quads_test() == 0){
    printf("Passed !\n");
  }else{
    //
  }

  printf("\nTest 4 : génération mips\n");
  if(mips_test() == 0){
    printf("Passed !\n");
  }else{
    //
  }

  return 0;
}