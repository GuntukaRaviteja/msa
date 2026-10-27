%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
%}

%token LETTER DIGIT

%%
start : LETTER tail '\n' { printf("Valid Variable\n"); }
      ;

tail  : LETTER tail
      | DIGIT tail
      | /* empty */
      ;
%%

int yylex() {
    int c = getchar();

    if (c >= 'a' && c <= 'z' ||
        c >= 'A' && c <= 'Z')
        return LETTER;

    if (c >= '0' && c <= '9')
        return DIGIT;

    return c;
}

void yyerror(const char *s) {
    printf("Invalid Variable\n");
}

int main() {
    printf("Enter variable: ");
    yyparse();
    return 0;
}
