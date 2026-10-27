%{
#include <stdio.h>
int vowels = 0, consonants = 0;
%}

%%
[AEIOUaeiou] { vowels++; }
[B-DF-HJ-NP-TV-Zb-df-hj-np-tv-z] { consonants++; }
[ \t\n]+ { /* ignore whitespace */ }
. { /* ignore other characters */ }

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: ./countvc filename\n");
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("File error");
        return 1;
    }

    yylex();

    printf("Vowels: %d\n", vowels);
    printf("Consonants: %d\n", consonants);

    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}