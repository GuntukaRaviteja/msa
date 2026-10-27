%{
#include <stdio.h>
int words = 0, special = 0, lines = 0;
%}

%%
[a-zA-Z0-9_]+ { words++; }
\n { lines++; }
[^a-zA-Z0-9_ \t\n] { special++; }
[ \t]+ { /* ignore spaces */ }

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: ./count filename\n");
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("File error");
        return 1;
    }

    yylex();

    printf("Words: %d\n", words);
    printf("Special characters: %d\n", special);
    printf("Lines: %d\n", lines + 1);

    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}
