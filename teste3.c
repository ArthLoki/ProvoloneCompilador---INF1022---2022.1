#include <stdio.h>
#include <stdlib.h>

             int provolone2c(int X, int Y, int Z) {

	if (X) {
		X++;
	}
	else{
		Z++;
	}

	return Z;

}

int main(int argc, char *argv[]) {
	int provol2c = provolone2c(atoi(argv[1]), atoi(argv[2]), atoi(argv[3]));
	printf("Result -> %d\n", provol2c);
	return 0;
}