int foo(int n) {

  int i, fat;

  if (n == 0) {

    n = 1;

  }

  else {

    fat = 1;
    i = n;

    while (i > 1) { /* max 3 */

      fat = fat*i;
      i--;
	}
  }

  return fat;

}

int main() {

	foo(3);
	return 0;
}
