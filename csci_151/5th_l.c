#include <stdio.h>

int main(){
    printf("==========================================\n");
    printf("== TASK 1: ==\n");
    printf("==========================================\n");

    int num, i, j, idf, idl, ids;
    double timef = 1000.00, timel = 0.00, times;
    printf("Please input the number of cars:\n");
    scanf("%d", &num);
    while ((getchar()) != '\n');
    int ID[num], POS[num], IDS[num], SP[num];
    printf("Please input starting points of each car:\n");
    for(i = 0; i < num; i++){
        scanf("%d %d", &ID[i], &POS[i]);
        while ((getchar()) != '\n');
    }
    printf("Please input speed of each car:\n");
    for(i = 0; i < num; i++){
        scanf("%d %d", &IDS[i], &SP[i]);
        while ((getchar()) != '\n');
    }
    for(i = 0; i < num; i++){
        for(j = 0; j < num; j++){
            if(ID[i] == IDS[j]){
                if(timef > ((1000.00 - (double)POS[i]) / (double)SP[j])){
                    times = timef;
                    ids = idf;
                    timef = ((1000.00 - (double)POS[i]) / (double)SP[j]);
                    idf = ID[i];
                }
                if(timel < ((1000.00 - (double)POS[i]) / (double)SP[j])){
                    timel = ((1000.00 - (double)POS[i]) / (double)SP[j]);
                    idl = ID[i];
                }
            }
        }
    }
    printf("The index of the fastest car is %d and its final time = %f\n", idf, timef);
    printf("The index of the second finishing car is %d and its final time = %f\n", ids, times);
    printf("The index of the slowest finishing car is %d and its final time = %f\n", idl, timel);

   
}