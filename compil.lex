%{
#include <stdio.h>
#include <string.h>
#include "sos.h"
%}

%option noyywrap

%x COMMENT

%s STRING

%%

"|'([^'"]|\\.)*'|\"([^\""]|\\.)*\"" {
    yylval.string = yytext + 1;
    yylval.string[strlen(yylval.string) - 1] = '\0';
    return STRING;
}

[a-z][a-z0-9]* {
    if (is_keyword(yytext)) {
        return yytext;
    }
    yylval.string = yytext;
    return IDENTIFIER;
}

[+-]?[0-9]+ {
    yylval.number = atoi(yytext);
    return NUMBER;
}

[ \t\n]+ { /* ignore */ }

#.* {
    yylval.string = yytext + 1;
    yylval.string[strlen(yylval.string) - 1] = '\0';
    return COMMENT;
}

[;\[\](){}=!|$*{}] { return yytext; }

[-+*/%<>]=?|!= { return yytext; }

. {
    yylval.char = yytext[0];
    return CHARACTER;
}

%%

int is_keyword(char *str) {
    /*
    Retourne 1 si str est un mot clé de SoS, 0 sinon.
    */
}