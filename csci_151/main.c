#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int main(int argc, char const *argv[])
{
	/*
	float a = 1.22;
	double dou = 1.23; // more accurate
	char ch = 'F';
	char str[] = "FFF"; //actually a string
	int num = 55;

	printf("%f\n", pow(2, 3) ); //2 to the power of 3
	printf("%f\n", sqrt(36) );
	printf("%f\n", ceil(36.23) ); //round number up
	printf("%f\n", floor(36.23) ); //round number down
	*/

	int num;
	printf("tell me number: ");
	scanf("%d", &num);
	printf("you choose number %d", num);
	
	return 0;
}