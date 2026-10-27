%{
#include <stdio.h>
%}

%%
[A-Z]       { printf("%s ", yytext); }
.|\n        ;
%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: ./uppercase filename\n");
        return 1;
    }

    yyin = fopen(argv[1], "r");

    if (!yyin) {
        perror("File error");
        return 1;
    }

    printf("Uppercase letters: ");
    yylex();
    printf("\n");

    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}