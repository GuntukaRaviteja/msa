#include <stdio.h>
#include <ctype.h>

char s[100];
int i = 0;

int E();
int T();
int F();

int E() {
    if (!T()) return 0;

    while (s[i] == '+') {
        i++;
        if (!T()) return 0;
    }
    return 1;
}

int T() {
    if (!F()) return 0;

    while (s[i] == '*') {
        i++;
        if (!F()) return 0;
    }
    return 1;
}

int F() {
    if (isalpha((unsigned char)s[i])) {
        i++;
        return 1;
    }

    if (s[i] == '(') {
        i++;
        if (!E() || s[i] != ')') return 0;
        i++;
        return 1;
    }

    return 0;
}

int main() {
    printf("Enter expression: ");
    scanf("%99s", s);

    if (E() && s[i] == '\0')
        printf("Valid Expression\n");
    else
        printf("Invalid Expression\n");

    return 0;
}