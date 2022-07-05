#include <stdio.h>
#include <stdlib.h>

          int provolone2c(A, int int B) {

	for (int i=0; i<B; i++) {
		A++;
	}

	return A;

}

int main(int argc, char *argv[]) {
	int provol2c = provolone2c(atoi(argv[1]), atoi(argv[2]));
	printf("Result -> %d\n", provol2c);
	return 0;
}