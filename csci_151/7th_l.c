#include <stdio.h>
#include <string.h>
#include <math.h>


typedef struct {
    char label [20];
    double x;
    double y;
} Point;

int N;

void close(Point pnt[], double R){
    int buf = 0, num = 0, let;
    for (int i = 0; i < N; i++){
        for (int j = 0; j < N; j++){
            if (i != j){
                double dist = ((pnt[i].x - pnt[j].x) * (pnt[i].x - pnt[j].x)) + ((pnt[i].y - pnt[j].y) * (pnt[i].y - pnt[j].y));
                if (dist < (R * R)){
                    num += 1;
                }
            }
        }
        if (num > buf){
            let = i;
            buf = num;
        }
        num = 0;
    }
    printf("The point is %s", pnt[let].label);
}

static int C, M;

typedef struct {
    char name [20];
    int date;
    float price;
    float discount;
}movie;

typedef struct {
    char cinemaName[20];
    movie listM[5];
}cinema;

static cinema cin[5];

void first(char * cname){
      if ((strlen(cname) > 0) && (cname[strlen (cname) - 1] == '\n'))
        cname[strlen (cname) - 1] = '\0';
    for (int i = 0; i < C; i++){
       if (strcmp(cin[i].cinemaName, cname) == 0){
            printf("The %s has the list of films:\n", cin[i].cinemaName);
            for (int j = 0; j < M;j++){
            printf("%s\n", cin[i].listM[j].name);
        }
        }
    }
    printf("\n");
}

void second(char * film, int date){
    if ((strlen(film) > 0) && (film[strlen (film) - 1] == '\n'))
        film[strlen (film) - 1] = '\0';
        int bufc, buf = 100, bufd;
        for (int i = 0; i < C; i++){
            for (int j = 0; j < M; j++){
                if (strcmp(cin[i].listM[j].name, film) == 0){
                    if ((cin[i].listM[j].date - date) < buf){
                        buf = cin[i].listM[j].date - date;
                        bufc = i;
                        bufd = cin[i].listM[j].date;
                    }
                }
            }
        }
        printf("The closest date is %d in the %s\n", bufd, cin[bufc].cinemaName);       
        printf("\n");
    }

void third(){
    printf("Cinema  list:\n");
    for (int i = 0; i < C; i++){
        printf("%s\n", cin[i].cinemaName);
    }
}


int main(){
    
    printf("==========================================\n");
    printf("== TASK 1: ==\n");
    printf("==========================================\n");
    printf("Enter the number of cinemas \n");
    scanf("%d", &C);
    printf("Enter the number of films in each cinema \n");
    scanf("%d", &M);



    FILE *cinema;
    cinema = fopen("moviesList.txt", "r");
    if(cinema == NULL){
        printf("Error! File can not be opened for writing.");
        return 0;
    }
    for (int i = 0; i < C; i++){
        fscanf(cinema, "%s", &cin[i].cinemaName);
        printf("%s\n", cin[i].cinemaName);
        for (int j = 0; j < M; j++){
            //fscanf(cinema, "%[^\n]s", &cin[i].listM[j].name);
            fscanf(cinema, "%s %d %f %f", &cin[i].listM[j].name, &cin[i].listM[j].date , &cin[i].listM[j].price, &cin[i].listM[j].discount);
            if ((strlen(cin[i].listM[j].name) > 0) && (cin[i].listM[j].name[strlen (cin[i].listM[j].name) - 1] == '\n'))
            cin[i].listM[j].name[strlen (cin[i].listM[j].name) - 1] = '\0';
            printf("%s %d %f %f\n", cin[i].listM[j].name, cin[i].listM[j].date , cin[i].listM[j].price, cin[i].listM[j].discount);
        }
    }
    char Cin[20];
    printf("Enter cinema name to get list of movies\n");
    scanf("%s", &Cin);
    first(Cin);
    char film[20];
    int date;
    printf("Enter film name: \n");
    scanf("%s", &film);
    printf("Enter date: \n");
    scanf("%d", &date);
    second(film, date);
    third();

    printf("==========================================\n");
    printf("== TASK 2: ==\n");
    printf("==========================================\n");

    double R;
    printf("Enter radius\n");
    scanf("%lf", &R);
    fflush(stdout);
    printf("Enter number of points\n");
    scanf("%d", &N);
    fflush(stdout);
    Point pnt[N];
    for (int i = 0; i < N; i++){
        printf("Enter point %d coordinates and label\n", (i + 1));
        scanf("%lf %lf %s", &pnt[i].x, &pnt[i].y, &pnt[i].label);
        fflush(stdout);
    }
    
    close(pnt, R);


}