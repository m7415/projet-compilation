%{
#include <stdio.h>
#include <stdlib.h>
#include "compil.tab.h"

extern int yylex();
extern void yyerror(const char * msg);


%}

%union {
    char * strval;
    int intval;
}

%token KW_IF KW_THEN KW_FOR KW_DO KW_DONE KW_IN KW_WHILE KW_UNTIL KW_CASE KW_ESAC KW_READ KW_RETURN KW_EXIT KW_LOCAL KW_ELIF KW_ELSE KW_FI KW_DECLARE KW_TEST KW_EXPR
%token<strval> STRING_DOUBLE_QUOTE STRING_SINGLE_QUOTE
%token<intval> NUMBER
%token IDENTIFIER
%token IS_EQ IS_DIFF
%token OP_NOT_NULL OP_NULL OP_EQ OP_NEQ OP_GT OP_GE OP_LT OP_LE
%token LOGIC_NOT LOGIC_AND LOGIC_OR


%left '+' '-'
%left '*' '/' '%'

%start programme

%%

programme : %empty

%%

void yyerror(const char * msg) {
  fprintf(stderr, "%s\n", msg);
}
