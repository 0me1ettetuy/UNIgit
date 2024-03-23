#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(){

    printf("==========================================\n");
    printf("== TASK 1: ==\n");
    printf("==========================================\n");
    
    int num;
    int i;
    int j;
    printf("Enter a number for '*': ");
    scanf("%d", &num);

    while (num > 0){
        
       while(num >= 1){

        for (i = 0; i < num; i++){
            printf("*");
        }
        for (j = 0; j < num / 2; j++){
            printf("&");
        }
        printf("\n");
        num = num / 2;
       }
        printf("Enter a number for '*': ");
        scanf("%d", &num);

    }
    printf("nothing to draw here!");

    printf("==========================================\n");
    printf("== TASK 2: ==\n");
    printf("==========================================\n");


    int deg;
    int pow;
    double x = 2;
    double res = 0;
    double fact = 1;
    int fir = 1;
    int i;
    int j;
    printf("Enter a degree: ");
    fflush(stdout);
    scanf("%d", &deg);
    double rad = deg * 3.1415926535 / 180;

    while (deg >= 0){

        for(i = 0; i < 45; i++){
            double arg = 1;
            pow = (2 * i + 1);

            for(j = 1; j <= pow; j++){
                arg *= rad;
                fact *= j;
            }
            res += (fir * arg / fact);
            fir *= -1;
        }

        printf("%.3f\n", res);
        fflush(stdout);
        printf("Enter a degree: ");
        fflush(stdout);
        scanf("%d", &deg);
        double rad = deg * 3.1415926535 / 180;

    }
    printf("negative number detected!");
    return 0;
}