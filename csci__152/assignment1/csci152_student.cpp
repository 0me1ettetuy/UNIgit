#include "csci152_student.h"
#include <iostream>
#include <vector>
#include <string> 
#include <iomanip>


/*class csci152_student {

	std::string name; // name of student

	// Note that we use non-negative integer scores for assignments, 
	// but that we use floating-point numbers for quizzes and the final
	// exam
	
	size_t num_of_assignments;		 // number of assignment_scores; this should be positive
	unsigned int *assignment_scores; // variable-length array; each item is out of 100 points

	size_t num_of_quizzes;		 // number of quiz_scores; this should always be 2 or more
	double *quiz_scores;	     // variable-length array; each item is out of 20.0 pts

	double final_exam_score;   // out of 100.0 points*/


csci152_student::csci152_student(
			std::string nm,
			std::initializer_list<unsigned int> assignments,
			std::initializer_list<double> quizzes,
			double final_exam
	) : name(nm), num_of_assignments(assignments.size()), num_of_quizzes(quizzes.size()), assignment_scores(new unsigned int[assignments.size()]), quiz_scores(new double[quizzes.size()]), final_exam_score(final_exam){
		unsigned int *ptra = assignment_scores;
		for(auto i : assignments){
			*ptra = i;
			ptra++;
		}
		double *ptrq = quiz_scores;
		for(auto j : quizzes){
			*ptrq = j;
			ptrq++;
		}
	}

csci152_student::csci152_student(const csci152_student& other) : name(other.name),
																	num_of_assignments(other.num_of_assignments),
																	num_of_quizzes(other.num_of_quizzes),
																	assignment_scores(new unsigned int[other.num_of_assignments]),
																	quiz_scores(new double[other.num_of_quizzes]),
																	final_exam_score(other.final_exam_score){
		unsigned int *ptra = assignment_scores;
		for(size_t i = 0; i < num_of_assignments; i++){
			*ptra = other.assignment_scores[i];
			ptra++;
		}
		double *ptrq = quiz_scores;
		for(size_t j = 0; j < num_of_quizzes; j++){
			*ptrq = other.quiz_scores[j];
			ptrq++;
		}
}

csci152_student& csci152_student::operator=(const csci152_student& other){
	name = other.name;
	num_of_assignments = other.num_of_assignments;
	num_of_quizzes = other.num_of_quizzes;

	delete[] assignment_scores;
	assignment_scores = new unsigned int[other.num_of_assignments];
		unsigned int *ptra = assignment_scores;
		for(size_t i = 0; i < num_of_assignments; i++){
			*ptra = other.assignment_scores[i];
			ptra++;
		}


	delete[] quiz_scores;
	quiz_scores = new double[other.num_of_quizzes];
		double *ptrq = quiz_scores;
		for(size_t j = 0; j < num_of_quizzes; j++){
			*ptrq = other.quiz_scores[j];
			ptrq++;
		}
	
	final_exam_score = other.final_exam_score;
	return *this;
}

std::string csci152_student::get_name() const{
    return name;
}

void csci152_student::change_name(std::string new_name){
    name = new_name;
}

double csci152_student::calculate_assignment_perc() const{
    double perc = 0;
    for( size_t i = 0; i < num_of_assignments; i++ ){
        perc += assignment_scores[i];
    }
    perc /= num_of_assignments;
    std::cout << std::fixed << std::setprecision(4);
    return perc;
}

double csci152_student::calculate_quiz_perc() const{
    double perc = 0;
    double low = 20.0;
    for( size_t i = 0; i < num_of_quizzes; i++ ){
        if (quiz_scores[i] < low){
            low = quiz_scores[i];
        }
    }
    for( size_t i = 0; i < num_of_quizzes; i++ ){
        if (quiz_scores[i] != low){
            perc += (quiz_scores[i] / 20.0) * 100.0;
        }
    }
    perc /= (num_of_quizzes - 1);
    std::cout << std::fixed << std::setprecision(4);
    return perc;
}

double csci152_student::get_final_exam_perc() const{
    return final_exam_score;
}

double csci152_student::calculate_course_perc() const{
    double gradeper;

    gradeper = (0.3500 * get_final_exam_perc()) + 10 + (0.2500 * calculate_assignment_perc()) + (0.4000 * calculate_quiz_perc());//WHAT DO I DO WITH THE LAB(10%)PERCENTAGE????
    std::cout << std::fixed << std::setprecision(4);
    return gradeper;
}

csci152_student::~csci152_student(){
    delete[] assignment_scores;
    delete[] quiz_scores;
}