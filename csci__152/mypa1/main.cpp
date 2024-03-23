#include "csci152_student.h"
#include <iostream>

void print(const csci152_student& student) {
	std::cout << student.get_name() << ": " << student.calculate_course_perc() << std::endl;
}

// This is a minimal testing file.... we will use something more complete
// for grading!!!
int main() {

	csci152_student agood("Agood Stutante",
					{100, 100, 100, 100},
					{20.0, 20.0, 2.3, 20.0, 20.0, 20.0},
					100);

	csci152_student abads("Abads Tudant",
					{50, 0, 10, 25, 3, 12},
					{2.1, 3.2, 7.4, 11.0, 3.6},
					35.8);

	print(agood);  // should print: Agood Stutante: 100
	print(abads);  // should print: Abads Tudant: 29.0817


	/*std::cout << "-----" << std::endl;

	csci152_student abads_clone(abads); // same as abads
	
	print(abads_clone);   // should print: Abads Tudant: 29.0817

	abads_clone.change_name("Abads' evil twin");

	print(abads_clone);   // should print: Abads' evil twin: 29.0817
	print(abads);         // should still print: Abads Tudant: 29.0817

	std::cout << "-----" << std::endl;

	abads = agood; // agood's values should be copied into abads

	agood.change_name("Elwood Stutante");

	print(abads);        // should print: Agood Stutante: 100
	print(agood); 		 // should print: Elwood Stutante: 100
	print(abads_clone);  // should print: Abads' evil twin: 29.0817*/

    return 0;
}



