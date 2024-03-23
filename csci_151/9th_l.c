#include <stdio.h>
#include <stdbool.h>
#include <string.h>

int validPasswordCheck (char str[]){
    bool up = false, letter = false, num = false, symbol = false;
    for (int i = 0; i < strlen(str); i++){
        if(str[i] >= 'A' && str[i] <= 'Z'){
            up = true;
            letter = true;
        }
        if(str[i] >= 'a' && str[i] <= 'z'){
            letter = true;
        }
        if(str[i] >= '0' && str[i] <= '9'){
            num = true;
        }
        if((str[i] >= 33 && str[i] <= 47) || (str[i] >= 58 && str[i] <= 64) || (str[i] >= 91 && str[i] <= 96) || (str[i] >= 123 && str[i] <= 126)){
            symbol = true;
        }
    }
    if(strlen(str) >= 8 && up && letter && num && symbol){
        return 1;
    }else{
        return 0;
    }
}


int countOfPattern (char text[], char pattern []){

int count = 0, res = 0;
for (int i = 0; i <= (strlen(text) - strlen(pattern)); i++){
    if (text[i] == pattern[0]){
    for (int j = 0; j < strlen(pattern); j++){
        if (text[i + j] == pattern[j]){
            count++;
        }
    }
    if (count == strlen(pattern)){
        count = 0;
        res++;
    }
    }
}
return res;
}


int main(){
    printf("==========================================\n");
    printf("== TASK 1: ==\n");
    printf("==========================================\n");

    char pass[1];
    printf("input a password: ");
    scanf("%s", &pass);
    while(validPasswordCheck (pass) == 0){
        printf("Please, try again\n");
        printf("input a password: ");
        scanf("%s", &pass);
        while ((getchar()) != '\n');
    }
    printf("Congratulations, the password is valid\n");

    char text[100], pat[100];
    printf("==========================================\n");
    printf("== TASK 2: ==\n");
    printf("==========================================\n");

    printf("Input a text: ");
    scanf("%s", &text);
    printf("Input a pattern: ");
    scanf("%s", &pat); 
    printf("Number of times pattern appeared in the text = %d", countOfPattern(text, pat));
}

