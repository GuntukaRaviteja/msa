%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
%}

%token ID
%left '+'

%%
start : E '\n' { printf("Valid Expression\n"); }
      ;

E     : E '+' E
      | '(' E ')'
      | ID
      ;
%%

int yylex() {
    int c;

    while ((c = getchar()) == ' ' || c == '\t')
        ;

    if (c >= 'a' && c <= 'z' ||
        c >= 'A' && c <= 'Z')
        return ID;

    return c;
}

void yyerror(const char *s) {
    printf("Invalid Expression\n");
}

int main() {
    printf("Enter expression: ");
    yyparse();
    return 0;
}