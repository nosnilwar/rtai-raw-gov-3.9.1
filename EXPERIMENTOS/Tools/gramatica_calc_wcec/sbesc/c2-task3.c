#include <stdio.h>

int main(int argc, char **argv) {

    int a, b, i;

    a = 20;
    b = 100;

    if (b % 2) {
        a /= argc;
        b /= (int)argv[0];
        argc += a + b;
    }

    else if (a - b != -5) {
        a = b + a;
        if (argv[a] != NULL) {
            a += 100;
            a -= b;
        }
    }

    else {
        b -= a;
        a -= argc;
        argc = b % a;
        a = a / b;
        if (argc - b > 0) {
            argc >>= a;
            b <<= argc;
            a = argc + b;
        }
    }

    b -= a;
    a -= argc;
    argv[0] = 0;

    if (a + b < argc) {
        b = a - a % b;
        for (i = 0; i < argc + b; i++) { /* max 5 */
            a += i + b;
        }
        b -= argc;
        a -= (int)argv[0];
    }

    argv[0] = 0;
    b -= argc << 2;
    a += b;

    while (a < b) { /* max 5 */
        a <<= b - argc;
        b /= argc;
    }

    if (b / argc != -1) {
        a -= b - argc;
        b >>= argc;
    }
    else {
        a >>= argc;
        a <<= b;
        a += a;
    }

    return 0;
}
