#include <stdio.h>
#include <stdlib.h>

                int provolone2c(int X, int Y) {

	for (int i=0; i<Y; i++) {
		for (int j=0; j<Y; j++) {
		X++;
	}
	}

	return X;

}

int main(int argc, char *argv[]) {
	int provol2c = provolone2c(atoi(argv[1]), atoi(argv[2]));
	printf("Result -> %d\n", provol2c);
	return 0;
}