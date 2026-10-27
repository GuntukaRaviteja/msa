%{
#include <stdio.h>
%}

%%
("boy"|"girl"|"dog"|"cat"|"book"|"school") { printf("%s is a noun\n", yytext); }
("run"|"eat"|"play"|"read"|"write"|"walk") { printf("%s is a verb\n", yytext); }
[a-zA-Z]+ { printf("%s is unknown\n", yytext); }
[ \t\n]+ { /* ignore whitespace */ }
. { /* ignore unknown characters */ }

%%

int main() {
    printf("Enter words:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}