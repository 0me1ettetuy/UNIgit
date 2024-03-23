#include <stdio.h>
#include <stdbool.h>

bool power(int n){
    if (n == 1){
        return true;
    }
    if(n % 3 == 0){
        if (n == 3){
            return true;
        }
        if (n == 0){
            return false;
        }
        if (power(n / 3)){
            return true;
        }
    } else {
        return false;
    }
}

int main(){

printf("==========================================\n");
printf("== TASK 1: ==\n");
printf("==========================================\n");

for (int i = 0; i <= 81; i++){
    if (power(i)){
        printf("---------------------------------\n");
        printf("%d is a power of three\n", i);
        printf("---------------------------------\n");
    } else {
        printf("%d is not a power of three\n", i);
    }


}

}