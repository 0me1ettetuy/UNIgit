#include <stdio.h>

int main(){
    char yess;
    do {
    char ch1, ch2, c;
    printf("Enter Player 1 choice ('R','P','S')\n");
    scanf("%c", &ch1);  //getting player 1 input value
    while ((getchar()) != '\n');    //clear input buffer
    while (!(ch1 == 'R' || ch1 == 'P' || ch1 == 'S')){  //repeating input in case user input is invalid
        printf("Not a valid input!\n");
        printf("Enter Player 1 choice ('R','P','S')\n");
        scanf("%c", &ch1); 
        while ((getchar()) != '\n');    //clear input buffer
    }
    printf("Enter Player 2 choice ('R','P','S')\n");
    scanf("%c", &ch2);  //getting player 2 input value
    while ((getchar()) != '\n');
    while (!(ch2 == 'R' || ch2 == 'P' || ch2 == 'S') || (ch1 == ch2)){  //repeating input in case user input is invalid
        if(!(ch2 == 'R' || ch2 == 'P' || ch2 == 'S')){
        printf("Not a valid input!\n");
        printf("Enter Player 2 choice ('R','P','S')\n");
        scanf("%c", &ch2);
        while ((getchar()) != '\n');    //clear input buffer
        }else{
        while(ch1 == ch2){  //repeating input in case player 1 choice == player 2 choise
            printf("Enter Player 2 choice ('R','P','S')\n");
            scanf("%c", &ch2);
            while ((getchar()) != '\n');    //clear input buffer
        }}
        }

            
    if((ch1 == 'R' && ch2 == 'P') || (ch1 == 'P' && ch2 == 'S') || (ch1 == 'S' && ch2 == 'R')){ //player 2 winning case output
        printf("Player 2 wins!\n");
    }
    if((ch1 == 'R' && ch2 == 'S') || (ch1 == 'P' && ch2 == 'R') || (ch1 == 'S' && ch2 == 'P')){ //player 1 winning case output
        printf("Player 1 wins!\n");
    }

    printf("Do you want to play again?(Enter 'Y' or 'y' for YES)\n");
    scanf("%c", &yess);
    while ((getchar()) != '\n');    //clear input buffer
    }while(yess == 'y' || yess == 'Y'); //game loop in case user wants to play again
    return 0;
    }