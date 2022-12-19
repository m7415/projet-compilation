%{
#include <stdio.h>
#include <string.h>
// #include "sos.h"
#include "compil.tab.h"
%}

%option nounput
%option noyywrap

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
    return STRING_DOUBLE_QUOTE;
}
\'([^\'\\]|\\.)*\' {
    // string entre '' (je vois pas comment gérer les " et ' en meme temps)
    return STRING_SINGLE_QUOTE;
}


[+-]?[0-9]+ {
    // yylval.number = atoi(yytext);
    return NUMBER;
}

"["   { return '[' ;}
"]"   { return ']' ;}
"{"   { return '{' ;}
"}"   { return '}' ;}
"("   { return '(' ;}
")"   { return ')' ;}
"+"   { return '+' ;}
"-"   { return '-' ;}
"*"   { return '*' ;}
"/"   { return '/' ;}
"%"   { return '%' ;}
"$"   { return '$' ;}
"?"   { return '?' ;}
";"   { return ';' ;}
"="   { return IS_EQ        ;}
"!="  { return IS_DIFF      ;}
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

[a-zA-Z][_a-zA-Z0-9] {
    // TODO revoir ça, et revoir la différence entre un id et un mot (cf grammaire)
    return IDENTIFIER;
}

[[:space:]] { 
    // le whitespace (sauf \n) => on ignore
}

. {
    fprintf(stderr, "Erreur lexicale : caractère non reconnu ('%c')", yytext[0]);
}

%%
