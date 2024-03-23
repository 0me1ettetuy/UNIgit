#include <stdio.h>

typedef struct{
        unsigned studentId;
        double studentAvg;
        double grades[3];
}Student;

typedef struct{
    unsigned courseId;
    double courseAvg;
}Course;

typedef struct{
    double schoolAvg;
    Course courses[3];
    Student students[3];
    char schoolName[21];
}School;

int main(){

    School Sch[3] = {
        [0] = {.schoolAvg = 0.0, .courses = {
            [0] = {.courseId = 0, .courseAvg = 0.0},
            [1] = {.courseId = 0, .courseAvg = 0.0},
            [2] = {.courseId = 0, .courseAvg = 0.0},
            }, .students = { 
                [0] = {.studentId = 0, .studentAvg = 0.0, .grades = {[0] = 0.0, [1] = 0.0, [2] = 0.0}},
                [1] = {.studentId = 0, .studentAvg = 0.0, .grades = {[0] = 0.0, [1] = 0.0, [2] = 0.0}},
                [2] = {.studentId = 0, .studentAvg = 0.0, .grades = {[0] = 0.0, [1] = 0.0, [2] = 0.0}},}},
        [1] = {.schoolAvg = 0.0, .courses = {
            [0] = {.courseId = 0, .courseAvg = 0.0},
            [1] = {.courseId = 0, .courseAvg = 0.0},
            [2] = {.courseId = 0, .courseAvg = 0.0},
            }, .students = { 
                [0] = {.studentId = 0, .studentAvg = 0.0, .grades = {[0] = 0.0, [1] = 0.0, [2] = 0.0}},
                [1] = {.studentId = 0, .studentAvg = 0.0, .grades = {[0] = 0.0, [1] = 0.0, [2] = 0.0}},
                [2] = {.studentId = 0, .studentAvg = 0.0, .grades = {[0] = 0.0, [1] = 0.0, [2] = 0.0}},}},
        [2] = {.schoolAvg = 0.0, .courses = {
            [0] = {.courseId = 0, .courseAvg = 0.0},
            [1] = {.courseId = 0, .courseAvg = 0.0},
            [2] = {.courseId = 0, .courseAvg = 0.0},
            }, .students = { 
                [0] = {.studentId = 0, .studentAvg = 0.0, .grades = {[0] = 0.0, [1] = 0.0, [2] = 0.0}},
                [1] = {.studentId = 0, .studentAvg = 0.0, .grades = {[0] = 0.0, [1] = 0.0, [2] = 0.0}},
                [2] = {.studentId = 0, .studentAvg = 0.0, .grades = {[0] = 0.0, [1] = 0.0, [2] = 0.0}},}},
    };


    FILE *fl1, *fl2, *fl3;
    fl1 = fopen("physics.txt", "r");
    fl2 = fopen("math.txt", "r");
    fl3 = fopen("computerScience.txt", "r");


    if(fl1 == NULL){
        printf("Error! File can not be opened for writing.");   //error warning if out.txt is NULL
        return 0;
    }

    if(fl2 == NULL){
        printf("Error! File can not be opened for writing.");   //error warning if out.txt is NULL
        return 0;
    }

    if(fl3 == NULL){
        printf("Error! File can not be opened for writing.");   //error warning if out.txt is NULL
        return 0;
    }

    fscanf(fl1, "%s ", &Sch[0].schoolName);
    printf("%s\n", Sch[0].schoolName);  
    for(int i = 0; i < 3; i++){
        for(int j = 0; j < 0; j++){
            fscanf(fl1, "%u", &Sch[0].students[i].studentId);
            fscanf(fl1, "%u", &Sch[0].courses[j].courseId);
            fscanf(fl1, "%lf", &Sch[0].students[i].grades[j]);
            Sch[0].courses[j].courseAvg += Sch[0].students[i].grades[j];
            Sch[0].schoolAvg += Sch[0].students[i].grades[j];
            Sch[0].students[i].studentAvg += Sch[0].students[i].grades[j];
    }
}

    Sch[0].courses[0].courseAvg /= 3;
    Sch[0].students[0].studentAvg /= 3;
    Sch[0].courses[1].courseAvg /= 3;
    Sch[0].students[1].studentAvg /= 3;
    Sch[0].courses[2].courseAvg /= 3;
    Sch[0].students[2].studentAvg /= 3;
    Sch[0].schoolAvg /= 9;

    fscanf(fl2, "%s ", &Sch[1].schoolName);
    printf("%s\n", Sch[1].schoolName);  
    for(int i = 0; i < 3; i++){
        for(int j = 0; j < 0; j++){
            fscanf(fl2, "%u", &Sch[1].students[i].studentId);
            fscanf(fl2, "%u", &Sch[1].courses[j].courseId);
            fscanf(fl2, "%lf", &Sch[1].students[i].grades[j]);
            Sch[1].courses[j].courseAvg += Sch[1].students[i].grades[j];
            Sch[1].schoolAvg += Sch[1].students[i].grades[j];
            Sch[1].students[i].studentAvg += Sch[1].students[i].grades[j];
    }
}

    Sch[1].courses[0].courseAvg /= 3;
    Sch[1].students[0].studentAvg /= 3;
    Sch[1].courses[1].courseAvg /= 3;
    Sch[1].students[1].studentAvg /= 3;
    Sch[1].courses[2].courseAvg /= 3;
    Sch[1].students[2].studentAvg /= 3;
    Sch[1].schoolAvg /= 9;

    fscanf(fl3, "%s ", &Sch[2].schoolName);
    printf("%s\n", Sch[2].schoolName);  
    for(int i = 0; i < 3; i++){
        for(int j = 0; j < 0; j++){
            fscanf(fl3, "%u", &Sch[2].students[i].studentId);
            fscanf(fl3, "%u", &Sch[2].courses[j].courseId);
            fscanf(fl3, "%lf", &Sch[2].students[i].grades[j]);
            Sch[2].courses[j].courseAvg += Sch[2].students[i].grades[j];
            Sch[2].schoolAvg += Sch[2].students[i].grades[j];
            Sch[2].students[i].studentAvg += Sch[2].students[i].grades[j];
    }
}

    Sch[2].courses[0].courseAvg /= 3;
    Sch[2].students[0].studentAvg /= 3;
    Sch[2].courses[1].courseAvg /= 3;
    Sch[2].students[1].studentAvg /= 3;
    Sch[2].courses[2].courseAvg /= 3;
    Sch[2].students[2].studentAvg /= 3;
    Sch[2].schoolAvg /= 9;

    for(int i = 0; i < 3; i++){
        printf("******The statistics for %c school*****\n\n", Sch[i].schoolName);
        for(int j = 0; j < 3; j++){
            printf("The student %u has got the average: %.2f\n", Sch[i].students[j].studentId, Sch[i].students[j].studentAvg);
        }
        printf("\n");
        for(int j = 0; j < 3; j++){
            printf("The course %u has the average: %.2f\n", Sch[i].courses[j].courseId, Sch[i].courses[j].courseAvg);
        }
        printf("\n");
        printf("The %c school has the average: %.2f\n", Sch[i].schoolName, Sch[i].schoolAvg);
    }

return 0;
}