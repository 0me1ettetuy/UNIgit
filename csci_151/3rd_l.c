#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(){
    printf("==========================================\n");
    printf("== TASK 1: ==\n");
    printf("==========================================\n");
    int aaa, bbb, ccc, i, widthA = 0, heightB = 0, squnum = 0, fib0 = 0, fib1 = 1, buf = 0;


    printf("Please input the value of A: ");
    scanf("%d", &aaa);
    printf("Please input the value of B: ");
    scanf("%d", &bbb);
    printf("Please input the value of C: ");
    scanf("%d", &ccc);

    do {
        aaa -= ccc;
        widthA +=1;
    }while(ccc <= aaa);

    do {
        bbb -= ccc;
        heightB +=1;
    }while(ccc <= bbb);

    for(i = 0; i < widthA; i++){
        squnum += heightB;
    }

    printf("%d\n", squnum);
    
    do{
        buf = fib0 + fib1;
        fib0 = fib1;
        fib1 = buf;
        if (buf = squnum){
            printf("Fibonacci!");
            break;
        }
    }while(buf <= squnum);



    printf("==========================================\n");
    printf("== TASK 2: ==\n");
    printf("==========================================\n");
    int num, i, j, buf, res = 0, odd = 0;

    printf("Please input the value of N: ");
    scanf("%d", &num);
    int flag = 0;
    for(i = 2; i < num; i++){
        flag = 0;
        for(j = 2; j < i; j++){
            if(i % j == 0){
                flag = 1;
                break;
                }
        }
        if(flag == 0){
            res += 1;
            buf = i;
            while(buf % 2 == 1){
                if(buf < 10){
                    odd += 1;
                    break;
                }
                buf = buf / 10;
            }
            }

    }
    printf("The number of primes is: %d\n", res);
    printf("The number of odd primes is: %d", odd);

    printf("==========================================\n");
    printf("== TASK 3: ==\n");
    printf("==========================================\n");

    int num, i, j, k, tri = 0;
    printf("Please input the value of N: ");
    scanf("%d", &num);
    for(i = 1; i <= num; i++){
        for(j = i + 1; j <= num; j++){
            for(k = j + 1; k <= num; k++){
                if(i + j > k && i + k > j && j + k > i && i != j != k){
                    tri++;
                }
            }
        }
    }
    printf("The number of valid triangles: %d", tri);
    }