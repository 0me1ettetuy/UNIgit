#include <stdio.h>

int main(){
    char day[20];
    int D, M, Y, K, J, E, F, G, H, I;
    printf("Enter the day of the month (1...31)\n");
    scanf("%d", &D);    //the day value input
    while ((getchar()) != '\n');    //clear input buffer
    while (!(D >= 1 && D <= 31)){   //repeating input in case user input is invalid
        printf("Not a valid input!\n");
        printf("Enter the day of the month (1...31)\n");
        scanf("%d", &D);
        while ((getchar()) != '\n');    //clear input buffer
    }
    printf("Enter the month of the year (1...12)\n");
    scanf("%d", &M);    //month value input
    while ((getchar()) != '\n');    //clear input buffer
    while (!(M >= 1 && M <= 12)){   //repeating input in case user input is invalid
        printf("Not a valid input!\n");
        printf("Enter the month of the year (1...12)\n");
        scanf("%d", &M);
        while ((getchar()) != '\n');    //clear input buffer
        }
    printf("Enter the year\n");
    scanf("%d", &Y);    //year value input
    while ((getchar()) != '\n');    //clear input buffer
    while (!(Y >= 1970 && Y <= 2022)){  //repeating input in case user input is invalid
        printf("Not a valid input!\n");
        printf("Enter the year\n");
        scanf("%d", &Y);
        while ((getchar()) != '\n');    //clear input buffer
    }

    if(M == 1 || M == 2){   //some calculations which i could not understand
        M += 12;
        Y -= 1;
    }

    J = Y / 100;
    K = Y % 100;
    E = 2.6 * M - 5.39;
    F = K / 4;
    G = J / 4;
    H = D + E + K + F + G - 2 * J;
    I = H % 7;

    if(I == 0){ //result output depending on the value of the I
        printf("The given date is Sunday!");
    }
    if(I == 1){
        printf("The given date is Monday!");
    }
    if(I == 2){
        printf("The given date is Tuesday!");
    }
    if(I == 3){
        printf("The given date is Wednesday!");
    }
    if(I == 4){
        printf("The given date is Thursday!");
    }
    if(I == 5){
        printf("The given date is Friday!");
    }
    if(I == 6){
        printf("The given date is Saturday!");
    }
    return 0;
    }