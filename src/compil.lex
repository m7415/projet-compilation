%{
#include <stdio.h>
#include <string.h>
// #include "sos.h"
#include "quads.h"
#include "compil.tab.h"
%}

%option nounput
%option noyywrap

IDENT [a-zA-Z_][a-zA-Z0-9_]*

%%

if      { return KW_IF      ;}
then    { return KW_THEN    ;}
for     { return KW_FOR     ;}
do      { return KW_DO      ;}
done    { return KW_DONE    ;}
in      { return KW_IN      ;}
while   { return KW_WHILE   ;}
until   { return KW_UNTIL   ;}
case    { return KW_CASE    ;}
esac    { return KW_ESAC    ;}
echo    { return KW_ECHO    ;}
read    { return KW_READ    ;}
return  { return KW_RETURN  ;}
exit    { return KW_EXIT    ;}
local   { return KW_LOCAL   ;}
elif    { return KW_ELIF    ;}
else    { return KW_ELSE    ;}
fi      { return KW_FI      ;}
declare { return KW_DECLARE ;}
test    { return KW_TEST    ;}
expr    { return KW_EXPR    ;}


\#.* {
    // commentaire = on ignore jusqu'à la fin de la ligne
}

\"([^\"\\]|\\.)*\" {
    // string entre ""
    // printf("string double quote (%s)\n", yytext);
    strncpy(yylval.str, yytext, MAX_STRING_SIZE);
    return STRING_DOUBLE_QUOTE;
}
\'([^\'\\]|\\.)*\' {
    // string entre '' (je vois pas comment gérer les " et ' en meme temps)
    // printf("string single quote (%s)\n", yytext);
    strncpy(yylval.str, yytext, MAX_STRING_SIZE);
    return STRING_SINGLE_QUOTE;
}

"+"|"-" { return PLUS_OU_MOINS ;}
"*"|"/"|"%" { return FOIS_DIV_MOD ;}
"["   { return O_BRACKET ;}
"]"   { return C_BRACKET ;}
"{"   { return O_CURLY_BRACKET ;}
"}"   { return C_CURLY_BRACKET ;}
"("   { return O_PAR ;}
")"   { return C_PAR ;}
"$"   { return DOLLAR ;}
"?"   { return QUESTION_MARK ;}
";"   { return SEMICOLON ;}
"="   { return EQUAL ;}
"!="  { return NOT_EQUAL      ;}
"-n"  { return OP_NOT_NULL  ;}
"-z"  { return OP_NULL      ;}
"-eq" { return OP_EQ        ;}
"-ne" { return OP_NEQ       ;}
"-gt" { return OP_GT        ;}
"-ge" { return OP_GE        ;}
"-lt" { return OP_LT        ;}
"-le" { return OP_LE        ;}
"!"   { return LOGIC_NOT    ;}
"-a"  { return LOGIC_AND    ;}
"-o"  { return LOGIC_OR     ;}

{IDENT} {
    // printf("identifier : (%s)\n", yytext);
    strncpy(yylval.str, yytext, MAX_STRING_SIZE);
    return IDENTIFIER;
}

[^\;\[\]\(\)\=\!\|\$\*\{\}\-\+\/\\\#\%\n\t[:space:]]* {
    // cette règle inclus les IDENTIFIER, c'est pourquoi on la met en dessous
    // cette règle inclu aussi les entiers 
    // (d'où l'absence d'un symbole terminal "entier" dans la grammaire)
    // printf("Mot : (%s)\n", yytext);
    strncpy(yylval.str, yytext, MAX_STRING_SIZE);
    return MOT;
}

\$\{{IDENT}\} {
    // printf("accès variable : ( %s )\n", yytext);
    strncpy(yylval.str, yytext+2, MAX_STRING_SIZE);
    yylval.str[ strlen(yylval.str) -1 ] = '\0'; // supprimer le '}'
    // de sorte que yylval.str contienne l'identificateur
    return ACCES_VARIABLE;
}

\$\{{IDENT}\[\*\]\} {
    // printf("accès tout les elems d'un tableau : (%s)\n", yytext);
    return ACCES_LISTE_TABLEAU;
}

\$\{{IDENT}\[[0-9]+\]\} {
    /*
    CETTE REGLE EST PAS BONNE !!!!!
    parce que l'index d'un tableau peut etre une expression compliquée, c'est
    pas forcément une constante...
    > dans les règles, ${id[<opérande entier>]} devient le terminal ACCES_ELEM_TABLEAU
    
    Pour l'instant on peut laisser comme ça, mais
    dans le futur, il faudrait détécter 
        > le terminal ${    \
        > le terminal id     > un seul (nouveau) terminal pour ça ? 
        > le terminal [     /
        > <opérance_entier>
        > le terminal ]
    */

    // un peu pénible pour récupérer l'index, mais bon
    // printf("accès elem tableau : (%s)\n", yytext);
    return ACCES_ELEM_TABLEAU;
}

\$[0-9]+ {
    // printf("accès argument : ( %s )\n", yytext);
    return ACCES_ARG;
}
\$\* {
    // liste des arguments d'une fonction
    return ACCES_LISTE_ARG;
}
\$\? {
    // code de retour de la dernière fonction appelée
    return LAST_FUNC_STATUS;
}



[[:space:]] { 
    // le whitespace (sauf \n) => on ignore
}

. {
    fprintf(stderr, "Erreur lexicale : caractère non reconnu ('%c')", yytext[0]);
}

%%
