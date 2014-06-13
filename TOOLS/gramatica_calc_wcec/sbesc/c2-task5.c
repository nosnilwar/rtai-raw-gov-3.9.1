#include <stdio.h>

int main(int argc, char **argv) {

    int a, b, i;

    a = 20;
    b = 100;
    if (a + b < argc) {
        a = b + argc;
        b = a - a % b;
        for (i = 0; i < argc + b; i++) { /* max 6 */
            a += i + b;
        }
    }
    else {
        a = b / argc;
        if (argv[a] != NULL) {
            a += 100;
            b += argc;
            a -= b;
        }
    }

    b -= a;
    a -= argc;
    argv[0] = 0;
    b -= argc;
    a -= b;

    return 0;
}
