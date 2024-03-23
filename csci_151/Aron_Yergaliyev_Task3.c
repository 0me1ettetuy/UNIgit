#include <stdio.h>

int main(){
    FILE *inp, *out;    //creating file variables
    inp = fopen("in.txt", "r");
    out = fopen("out.txt", "w");
    int shift;
    char ch;

    printf("Enter the value of p for encryption\n");
    scanf("%d", &shift);    //shift value input
    while ((getchar()) != '\n');    //clear input buffer

    if(inp == NULL){
        printf("Error! File can not be opened for reading.");   //error warning if in.txt is NULL
        return 0;
    }

    if(out == NULL){
        printf("Error! File can not be opened for writing.");   //error warning if out.txt is NULL
        return 0;
    }

    fscanf(inp, "%c", &ch); //reading the in.txt characters
    while(!feof(inp)){
        if(ch >=  'A' && ch <= 'Z'){    //sorting characters to get capital letters only
            if((ch + shift) > 'Z'){
                ch = ('@' + (shift - ('Z' - ch)));  //encrypting characters which are out of range
            }else{
                ch = ch + shift;    //encrypting characters
            }
        }
        fprintf(out, "%c", ch); //output of the encrypted characters in the out.txt
        fscanf(inp, "%c", &ch); //reading the in.txt characters
    }
    printf("out.txt has been created successfully.");
}