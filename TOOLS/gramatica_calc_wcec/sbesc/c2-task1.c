#include <stdio.h>

int main(int argc, char **argv) {

    int a, b, i;

    a = 20;
    b = 100;
    for (i = 0; i < a; i++) { /* max 7 */
        b <<= i;
        if (b < a + argc) {
            b += a;
        }
    }

    a -= b + argc;
    a++;
    b += (int)argv[0] + argc;
    a++;
    b += (int)argv[0] + argc;
    a++;

    if (b % 2) {
        a /= argc;
        b /= (int)argv[0];
        argc += a + b;
    }

    if (a + b < argc) {
        a = b + argc;
        b = a - a % b;
        for (i = 0; i < argc + b; i++) { /* max 8 */
            a += i + b;
        }
        b -= argc;
        a -= (int)argv[0];
    }

    else if (a - b != -5) {
        a = b / argc;
        if (argv[a] != NULL) {
            a += 100;
            b += argc;
            a -= b;
        }
    }

    else {
        b -= a;
        a -= argc;
        for (i = 0; i < argc; i++) { /* max 5 */
            a <<= i;
            b >>= i;
        }
        argc = b % a;
        a = a / b;
        if (argc - b > 0) {
            argc >>= a;
            b <<= argc;
            a = argc + b;
        }
        else {
            a <<= i;
            b >>= i;
            b = a;
            argc = a;
            a = b;
        }
    }

    b -= a;
    a -= argc;
    argv[0] = 0;
    b -= argc;
    a -= b;
    b -= a;
    a -= argc;
    argv[0] = 0;
    b -= argc;
    a -= b;

    while (a < b) { /* max 7 */
        a >>= argc;
        a <<= b;
        a += a;
    }

    if (b / argc != -1) {
        a -= b - argc;
        b >>= argc;
    }
    else {
        a <<= b - argc;
        b /= argc;
    }

    argv[0] = 0;
    b -= argc << 2;
    a += b;
    b += a << (int)argv[0];
    a -= argc;
    a <<= b;
    b >>= a;

    return 0;
}
