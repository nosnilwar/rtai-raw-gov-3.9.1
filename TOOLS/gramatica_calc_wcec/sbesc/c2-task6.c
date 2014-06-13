#include <stdio.h>

int main(int argc, char **argv) {

    int a, b, i;

    a = 20;
    b = 100;
    if (a + b < argc) {
        a = b + argc;
        b = a - a % b;
        argv[0] = 0;
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

    if (a % 2 == 0) {
        a -= argc + b*b;
        argc = a - b;
        b = a - a % b;
    }
    else if (b % 2 != 0) {
        argc = a - b;
        a++;
        b++;
    }

    for (i = 0; i < argc + b; i++) { /* max 3 */
        a += i + b;
        b -= argc;
        a -= b;
    }

    return 0;
}
