#include <stdio.h>

int main(int argc, char **argv) {

    int a, b, i;

    a = 20;
    b = 100;
    if (a + b < argc) {
        a = b + argc;
        b = a - a % b;
        for (i = 0; i < argc + b; i++) { /* max 10 */
            a += i + b;
        }
    }
    else {
        a = b / argc;
        if (argv[a] != NULL) {
            a += 100;
            while (a < b % argc) { /* max 5 */
                a += a;
                b += b;
            }
            b += argc;
            a -= b;
        }
        else {
            b += a + argc;
        }
    }

    b -= a;
    a -= argc;
    argv[0] = 0;
    b -= argc;
    a -= b;

    if (a == 1) {
        b = argc % 255;
        a <<= 8;
    }

    return 0;
}
