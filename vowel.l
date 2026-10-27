%{
#include <stdio.h>
%}

%%
[AEIOUaeiou] { printf("%s is a vowel\n", yytext); }
[B-DF-HJ-NP-TV-Zb-df-hj-np-tv-z] { printf("%s is a consonant\n", yytext); }
[ \t\n]+ { /* ignore whitespace */ }
. { printf("%s is not an alphabet\n", yytext); }

%%

int main() {
    printf("Enter characters:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
