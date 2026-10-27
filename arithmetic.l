%{
#include <stdio.h>
%}

%%
[0-9]+(\.[0-9]+)? { printf("Number: %s\n", yytext); }
[+\-*/%] { printf("Arithmetic operator: %s\n", yytext); }
[ \t\n]+ { /* ignore whitespace */ }
. { printf("Other: %s\n", yytext); }

%%

int main() {
    printf("Enter expression:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}