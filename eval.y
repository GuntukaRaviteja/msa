%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%left UMINUS

%%
input : expr '\n' { printf("Result = %d\n", $1); }
      ;

expr  : expr '+' expr { $$ = $1 + $3; }
      | expr '-' expr { $$ = $1 - $3; }
      | expr '*' expr { $$ = $1 * $3; }
      | expr '/' expr {
            if ($3 == 0) {
                yyerror("Division by zero");
                YYABORT;
            }
            $$ = $1 / $3;
        }
      | '-' expr %prec UMINUS { $$ = -$2; }
      | '(' expr ')' { $$ = $2; }
      | NUMBER { $$ = $1; }
      ;
%%

int yylex() {
    int c;

    while ((c = getchar()) == ' ' || c == '\t')
        ;

    if (c >= '0' && c <= '9') {
        ungetc(c, stdin);
        scanf("%d", &yylval);
        return NUMBER;
    }

    return c;
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter expression: ");
    yyparse();
    return 0;
}
