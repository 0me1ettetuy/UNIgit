#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(){
    
    int x;
    printf("==========================================\n");
    printf("== TASK 1: ==\n");
    printf("==========================================\n");
    
    printf("Please provide the value of x: ");
    scanf("%d", &x);
    printf("The value of the expression is equal to %f", (2 * pow(x, 6) - 8.3 * pow(x, 4) + 10 * x - 9.1));


    printf("==========================================\n");
    printf("== TASK 2: ==\n");
    printf("==========================================\n");

    int h, m, s;
    printf("Please provide the value of hours: \n");
    scanf("%d", &h);
    printf("Please provide the value of minutes: \n");
    scanf("%d", &m);
    printf("Please provide the value of seconds: \n");
    scanf("%d", &s);
    printf("Shifted time is %d : %d : %d", h + 2, m + 5, s + 10);


    printf("==========================================\n");
    printf("== TASK 3: ==\n");
    printf("==========================================\n");

    char c = 35;
    printf("%6c%5c\n", c, c);
    printf("%5c%2c%4c\n", c, c, c);
    printf("%4c%c%c%c%c%3c\n", c, c, c, c, c, c);
    printf("%3c%6c%2c\n", c, c, c);


    printf("==========================================\n");
    printf("== TASK 4: ==\n");
    printf("==========================================\n");


    int side;
    printf("Please input the side length x of the figure: ");
    scanf("%d", &side);
    printf("The total area of the figure is equal to %f", pow(side, 2) + (1.732 * pow(side, 2))/4);
}