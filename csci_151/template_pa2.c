#include <stdio.h>

typedef struct {
	int itemNumber, infoNumber;
	char topic[27];
	char info[27];
} DataItem;

typedef struct {
	int numberCorrect;
	int numberWrong;
	int learningIndex;
	double ratioCorrect;
} ResultItem;


// BEGIN AUXILIARY FUNCTIONS (IF ANY)

// END  AUXILIARY FUNCTIONS (IF ANY)


// BEGIN TASK 1
void loadData (DataItem data[][3], char filename[]){
	FILE *fl1;
	fl1 = fopen(filename, "r");

	int i = 0, j = 0, k = 0;
	char buf;
	while(!feof(fl1)){
		fscanf(fl1, "%c", &buf);
		if(i == 0){
			if(buf == "\n"){
				k = 0;
				if(j == 3){
					j = 0;
					i++;
				}else{
					j++;
				}
				data[0][j-1].infoNumber = 3;
			}else{
				if(j == 0){
					data[i][0].topic[k] = buf;
					data[i][1].topic[k] = buf;
					data[i][2].topic[k] = buf;
					k++;
				}
				if(j == 1){
					data[i][0].info[k] = buf;
					k++;
				}
				if(j == 2){
					data[i][1].info[k] = buf;
					k++;
				}
				if(j == 3){
					data[i][2].info[k] = buf;
					k++;
				}
			}	
		}else{
			if(buf == "\n"){
				k = 0;
				if(j == 3){
					j = 0;
					i++;
				}else{
					j++;
				}
				data[i][j-1].itemNumber = i;
				data[i][j-1].infoNumber = j-1;
			}else{
				if(j == 0){
					data[i][0].topic[k] = buf;
					data[i][1].topic[k] = buf;
					data[i][2].topic[k] = buf;
					k++;
				}
				if(j == 1){
					data[i][0].info[k] = buf;
					k++;
				}
				if(j == 2){
					data[i][1].info[k] = buf;
					k++;
				}
				if(j == 3){
					data[i][2].info[k] = buf;
					k++;
				}
			}
		}
	}
	data[0][0].itemNumber = i;
	printf("%d", i);
	/*int i = 0;
	char topicc[27];
	while(feof(fl1)){
		if(i = 0){
			data[i][0].itemNumber = i;
			data[i][0].infoNumber = 3;
			scanf("%s", data[i][0].topic);
			scanf("%s", data[0][0].info);
			scanf("%s", data[0][1].info);
			scanf("%s", data[0][2].info);
		}else{
			scanf("%s", &topicc);
			for(int j = 0; j <= 2; j++){
				data[i][j].itemNumber = i;
				data[i][j].infoNumber = j;
				data[i][j].topic = topicc;
				scanf("%s", &data[i][j].info);
			}
		}
		i++;
	}
	data[0][0].itemNumber = (i - 1);
	return (i - 1);*/
}
// END TASK 1


// BEGIN TASK 2

// END TASK 2


// BEGIN TASK 3

// END TASK 3


int main(void) {

	setvbuf(stdout, NULL, _IONBF, 0);

// INSERT HERE your first name, last name and student ID
	char firstName[] = "Aron";
	char lastName[] = "Yergaliyev";
	char studentID[] = "202155785";

// DO NOT REMOVE OR CHANGE THIS PRINT STATEMENT
	printf("\n%s %s %s\n\n", firstName, lastName, studentID);


void loadData (DataItem[][3], char[]);
// BEGIN TESTING PART FOR TASK 1
DataItem data[][3] = {};
//printf("%d", LoadData(data, "geography_data.txt"));
loadData(data, "geography_data.txt");
// END TESTING PART FOR TASK 1


int loadResults (int, ResultItem[][3], char[]);
// BEGIN TESTING PART FOR TASK 2

// END TESTING PART FOR TASK 2


int learned (int, ResultItem[][3], int);
// BEGIN TESTING PART FOR TASK 3

// END TESTING PART FOR TASK 3


    return 0;
}
