#include <stdio.h>
#include <stdbool.h>


typedef struct {
	int itemNumber, infoNumber;
	char topic[27];
	char info[27];
} DataItem;


int main(){

DataItem data[][3] = {};

FILE *fl1;
	fl1 = fopen("geography_data.txt", "r");
	/*char g;
	g = getc(fl1);
	data[0][0].topic[0] = g;
	printf("%c", data[0][0].topic[0]);*/

	int i = 0, j = 0, k = 0, line = 0;
	char buf;
	char array[100][27];
	while(!feof(fl1)){
		buf = getc(fl1);
		if(buf != 10){
			array[line][k] = buf;
			k++;
		}else{
			array[line][k] = '\0';
			k = 0;
			line++;
		}
	}
	int a = 0, n = 0;
	for(int i = 0; i < ((line / 4) - 1); i++){
		for(int j = 0; j < 3; j++){
			n = 0;
			while(array[a][n] != '\0'){
				data[i][j].topic[n] = array[a][n];
				n++;
			}
		}
		a =+ 4;
	}
	printf("%d", (line / 4) - 1);
	printf("%s", array[5]);
	printf("%s", data[0][2].topic);
	/*data[0][0].itemNumber = i - 2;
	data[0][1].itemNumber = i - 2;
	data[0][2].itemNumber = i - 2;
	data[0][0].infoNumber = 3;
	data[0][1].infoNumber = 3;
	data[0][2].infoNumber = 3;
	printf("%d", data[0][2].itemNumber);*/
	//data[0][0].infoNumber = 2;
    //printf("%d", data[0][2].infoNumber);
	//printf("%d", i - 1);

}





/*if(i == 0){
			printf("1");
			//char buf;
			k = 0;
			while((buf = getc(fl1)) != 10){
				
				//data[0][1].topic[k] = buf;
				//data[0][2].topic[k] = buf;
				//fscanf(fl1, "%c", &buf);
				//buf = getc(fl1);
				if(buf == EOF){
					printf("fuck");
					break;
				}
				data[0][0].topic[k] = buf;
				buf = data[0][0].topic[k];
				printf("%c", buf);
				k++;
			}
			printf("2");
			//buf = "";
			k = 0;
			while((buf = getc(fl1)) != 10){
				//fscanf(fl1, "%c", &buf);
				//buf = getc(fl1);
				if(buf == EOF){
					break;
				}
				printf("%c", buf);
				k++;
			}
			printf("3");
			//char buf;
			k = 0;
			while((buf = getc(fl1)) != 10){
				//fscanf(fl1, "%c", &buf);
				//buf = getc(fl1);
				if(buf == EOF){
					break;
				}
				printf("%c", buf);
				k++;
			}
			printf("4");
			//char buf;
			k = 0;
			while((buf = getc(fl1)) != 10){
				//fscanf(fl1, "%c", &buf);
				//buf = getc(fl1);
				if(buf == EOF){
					break;
				}
				printf("%c", buf);
				k++;
		}
		i++;
	}else{
			printf("1");
			//char buf;
			k = 0;
			while((buf = getc(fl1)) != 10){
				//fscanf(fl1, "%c", &buf);
				//buf = getc(fl1);
				if(buf == EOF){
					break;
				}
				printf("%c", buf);
				k++;
			}
			printf("2");
			//buf = "";
			k = 0;
			while((buf = getc(fl1)) != 10){
				//fscanf(fl1, "%c", &buf);
				//buf = getc(fl1);
				if(buf == EOF){
					break;
				}
				printf("%c", buf);
				k++;
			}
			printf("3");
			//char buf;
			k = 0;
			while((buf = getc(fl1)) != 10){
				//fscanf(fl1, "%c", &buf);
				//buf = getc(fl1);
				if(buf == EOF){
					break;
				}
				printf("%c", buf);
				k++;
			}
			printf("4");
			//char buf;
			k = 0;
			while((buf = getc(fl1)) != 10){
				//fscanf(fl1, "%c", &buf);
				//buf = getc(fl1);
				if(buf == EOF){
					break;
				}
				printf("%c", buf);
				k++;
		}
		i++;
	}*/


/*printf("1");
		buf = " ";
		while(buf != 10){
			//fscanf(fl1, "%c", &buf);
			buf = getc(fl1);
			printf("%c", buf);
		}
		printf("2");
		buf = " ";
		while(buf != 10){
			//fscanf(fl1, "%c", &buf);
			buf = getc(fl1);
			printf("%c", buf);
		}
		printf("3");
		buf = " ";
		while(buf != 10){
			//fscanf(fl1, "%c", &buf);
			buf = getc(fl1);
			printf("%c", buf);
		}
		printf("4");
		buf = " ";
		while(buf != 10){
			//fscanf(fl1, "%c", &buf);
			buf = getc(fl1);
			printf("%c", buf);
		}*/





/*while(!feof(fl1)){
        fscanf(fl1, "%c", &buf);
if(i == 0){
			if(buf == 10){
                printf("%c", buf);
				k = 0;
                printf("%d", j);
				if(j == 3){
					j = 0;
					i++;
				}else{
					data[0][j].infoNumber = j;
					j++;
				}
				
			}else{
				if(j == 0){
                    printf("%c", buf);
					k++;
				}
				if(j == 1){
					printf("%c", buf);
					k++;
				}
				if(j == 2){
					printf("%c", buf);
					k++;
				}
				if(j == 3){
					printf("%c", buf);
					k++;
				}
			}	
		}else{

			if(buf == 10){
                printf("%c", buf);
				k = 0;
				if(j == 3){
					j = 0;
					i++;
				}else{
					data[i][j].infoNumber = j;
					j++;
				}

			}else{
				if(j == 0){
					printf("%c", buf);
					k++;
				}
				if(j == 1){
					printf("%c", buf);
					k++;
				}
				if(j == 2){
					printf("%c", buf);
					k++;
				}
				if(j == 3){
					printf("%c", buf);
					k++;
				}
			}
		}
	}*/