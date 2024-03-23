#include <stdio.h>
#include <stdlib.h>

int main(){
    printf("==========================================\n");
    printf("== TASK 1: ==\n");
    printf("==========================================\n");
    
    FILE *inp, *out;
    char ch;
    int flag = 1;

    inp = fopen("inputText1.txt", "r");
    out = fopen("outputText1.txt", "w");

    if(inp == NULL){
        printf("Error! File can not be opened for reading.");
        return 0;
    }

    if(out == NULL){
        printf("Error! File can not be opened for writing.");
        return 0;
    }
    fscanf(inp, "%c", &ch);
while(!feof(inp)){
    
    if((ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') || ch == ',' || ch == '.' || ch == ' ' || (ch >= '0' && ch <= '9')){
        if(flag == 1 && (ch >= 'a' && ch <= 'z')){
            ch = ch - 32;
            flag = 0;
        }
        if(ch == ' '){
            flag = 1;
        }
        fprintf(out,"%c", ch);
    }
    fscanf(inp, "%c", &ch);
    }

    printf("==========================================\n");
    printf("== TASK 2: ==\n");
    printf("==========================================\n");

    FILE *inp2, *out2;
    int i, id;
    float grd;

    inp2 = fopen("inputText2.txt", "r") ;
    out2 = fopen("outputText2.txt", "w");

    if(inp2 == NULL){
        printf("Error! File can not be opened for reading.");
        return 0;
    }

    if(out2 == NULL){
        printf("Error! File can not be opened for writing.");
        return 0;
    }
    printf("id        grade1   grade2   grade3   grade4\n");
    fprintf(out2, "id        grade1   grade2   grade3   grade4  |  AVG\n");
    fprintf(out2, "------------------------------------------------------\n");
    while(!feof(inp2)){
        float avg = 0.00, buf = 100.00;
        fscanf(inp2, "%d", &id);
        printf("%d  ", id);
        fprintf(out2, "%d  ", id);
        for(i = 0; i < 4; i++){
            fscanf(inp2, "%f", &grd);
            if(grd < buf){
                buf = grd;
            }
            avg += grd;
            if(grd == 100.00){
                printf("   %.2f", grd);
                fprintf(out2, "   %.2f", grd); 
            }
            if(grd < 100.00 && grd > 10.00){
                printf("    %.2f", grd);
                fprintf(out2, "    %.2f", grd); 
            }
            if(grd <= 10.00){
                printf("     %.2f", grd);
                fprintf(out2, "     %.2f", grd); 
            }
        }
        printf("\n");
        fprintf(out2, "  |  %.2f\n", ((avg - buf) / 3));
    }


    }