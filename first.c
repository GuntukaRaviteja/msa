#include <stdio.h>

int main() {
    printf("Grammar:\n");
    printf("E -> E+T | T\n");
    printf("T -> T*F | F\n");
    printf("F -> (E) | id\n\n");

    printf("FIRST(E) = { (, id }\n");
    printf("FIRST(T) = { (, id }\n");
    printf("FIRST(F) = { (, id }\n");

    return 0;
}