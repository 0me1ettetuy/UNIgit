#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>

typedef struct Email{
    int time;
    char * from;
    char * to;
    char * text;
}Email;

typedef struct QNode{
    Email * data;
    QNode* prev;
    QNode* next;
}QNode;

QNode * push(QNode * head, Email * email){
    
}