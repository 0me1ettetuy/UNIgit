/*
 ============================================================================
//Libraries allowed: <stdio.h> <stdbool.h> <string.h>
//From <stdlib.h> you CAN NOT use anything. It's for CALLOC()
//You may add more testing into main() but don't remove the code provided by us
 ============================================================================
 */

#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>
/*
 * A  95-100
 * A- 90-95
 * B+ 85-90
 * B  80-85
 * B- 75-80
 * C+ 70-75
 * C  65-70
 * C- 60-65
 * D+ 55-60
 * D  50-55
 * F   0-50
 */
const char GRADES[11][3] =
		{"A", "A-", "B+",
		"B", "B-", "C+",
		"C", "C-", "D+",
		"D", "F"};

typedef struct{
	char firstname[11];
	int grade;
} GradeList;

void CountStudents(int *numStudents, char *filename){
	FILE *fl1;
	fl1 = fopen(filename, "r");
	char bufs[100];
	int bufi;
	int i = 0;
	while(!feof(fl1)){
		fscanf(fl1, "%s		%d", bufs, &bufi);
		//printf("%s %d\n", bufs, grade);
		i++;
	}
	*numStudents = i;
}

void FillGradeList(GradeList *gList, int numStudents, char *filename){
	FILE *fl1;
	fl1 = fopen(filename, "r");
	int i = 0;
	while(!feof(fl1)){
		fscanf(fl1, "%s		%d", gList[i].firstname, &gList[i].grade);
		i++;
	}
}

char* GradeConverter(int grade){

	char *str = calloc (3, sizeof (char)); 	// string to return, format "September-14", allocates memory for 13 chars, initialized with '\0'
	if (grade >= 95){
			 str[0] = GRADES[0][0];
			 str[1] = GRADES[0][1];
			 str[2] = GRADES[0][2];
		}
	if (grade >= 90 && grade < 95){
			str[0] = GRADES[1][0];
			str[1] = GRADES[1][1];
			str[2] = GRADES[1][2];		
		}
		if (grade >= 85 && grade < 90){
			str[0] = GRADES[2][0];
			str[1] = GRADES[2][1];
			str[2] = GRADES[2][2];
		}
		if (grade >= 80 && grade < 85){
			str[0] = GRADES[3][0];
			str[1] = GRADES[3][1];
			str[2] = GRADES[3][2];
		}
		if (grade >= 75 && grade < 80){
			str[0] = GRADES[4][0];
			str[1] = GRADES[4][1];
			str[2] = GRADES[4][2];
		}
		if (grade >= 70 && grade < 75){
			str[0] = GRADES[5][0];
			str[1] = GRADES[5][1];
			str[2] = GRADES[5][2];
		}
		if (grade >= 65 && grade < 70){
			str[0] = GRADES[6][0];
			str[1] = GRADES[6][1];
			str[2] = GRADES[6][2];
		}
		if (grade >= 60 && grade < 65){
			str[0] = GRADES[7][0];
			str[1] = GRADES[7][1];
			str[2] = GRADES[7][2];
		}
		if (grade >= 55 && grade < 60){
			str[0] = GRADES[8][0];
			str[1] = GRADES[8][1];
			str[2] = GRADES[8][2];
		}
		if (grade >= 50 && grade < 55){
			str[0] = GRADES[9][0];
			str[1] = GRADES[9][1];
			str[2] = GRADES[9][2];
		}
		if (grade < 50){
			str[0] = GRADES[10][0];
			str[1] = GRADES[10][1];
			str[2] = GRADES[10][2];
		}
		return str;
}

void GradeOutput(GradeList bL[], int nStudents){
	for(int i = 0; i < nStudents; i++){
		printf("%s's grade letter is %s\n", bL[i].firstname, GradeConverter(bL[i].grade));
	}
}


int main(void) {

	int numStudents;
	CountStudents(&numStudents, "grades.txt");
	printf("numStudents = %i\n", numStudents);

	GradeList bList[numStudents];
	FillGradeList(bList, numStudents, "grades.txt");

	GradeOutput(bList, numStudents);

	return 0;
}
