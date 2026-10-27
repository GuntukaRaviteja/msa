#include <stdio.h>
#include <string.h>

struct Symbol {
    char name[20];
    char type[20];
};

int main() {
    struct Symbol s[20];
    int n, i;

    printf("Enter number of symbols: ");
    scanf("%d", &n);

    for (i = 0; i < n; i++) {
        printf("Enter name and type: ");
        scanf("%19s %19s", s[i].name, s[i].type);
    }

    printf("\nSymbol Table\n");
    printf("Name\tType\n");

    for (i = 0; i < n; i++)
        printf("%s\t%s\n", s[i].name, s[i].type);

    return 0;
}