%{
#include <stdio.h>
%}

%%
("int"|"float"|"char"|"if"|"else"|"while"|"for"|"return"|"void") { printf("Keyword: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }
[ \t\n]+ { /* ignore whitespace */ }
. { /* ignore unknown chars */ }

%%

int main() {
    printf("Enter words:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
