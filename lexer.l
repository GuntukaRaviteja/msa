%{
#include <stdio.h>
%}

%%
"//".*                  { printf("Comment: %s\n", yytext); }
[0-9]+                  { printf("Constant: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*  { printf("Identifier: %s\n", yytext); }
[+\-*/=]                { printf("Operator: %s\n", yytext); }
[ \t\n]+                ;
.                       { printf("Special character: %s\n", yytext); }
%%

int main() {
    printf("Enter input (Ctrl+D to stop):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}