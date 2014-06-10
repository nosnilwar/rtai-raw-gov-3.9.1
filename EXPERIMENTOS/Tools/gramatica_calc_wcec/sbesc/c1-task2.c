#include <stdio.h>

int main(int argc, char **argv) {

    int a, b, i;

    a = 20;
    b = 100;
    if (b < a + argc) {
        b += a;
    }

    a -= b + argc;
    b += ((int)argv[0]) + argc;
    a++;

    if (b % 2 == 0) {
        a /= argc;
        b /= (int)argv[0];
        argc += a + b;
        if (a << 2 && b << argc) {
            argc = a * b;
            b += b;
        }
    }
    else if (a % 2 == 0) {
        b = a;
        a = b / argc * a;
        b += a / 2;
        if (a > 0) {
            argc += b;
        }
    }

    b -= a - argc;
    a /= b;
    argc = 0;

    return 0;
}
