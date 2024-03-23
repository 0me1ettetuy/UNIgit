#include <iostream>
#include <vector>
#include <string>
#include "library.h"


int main( int argc, char* argv [ ] ){

    Library lib;
    Book b1("Harry Potter", "Somebody1", 2003);
    lib.addBook(b1);
    Book b2("Physics of the fuure", "Somebody2", 2004);
    lib.addBook(b2);
    Book b3("Martian", "Somebody3", 2004);
    lib.addBook(b3);
    
    lib.printBooks();

    lib.removeBook("Harry Potter");

    std::cout << "After remove function" << "\n";
    lib.printBooks();

    std::vector<int> nums;
    nums = getNumbers();

    std::cout << "SUM: " << sum(nums) << "\n";
    std::cout << "AVG: " << average(nums) << "\n";

    std::string str;
    std::cout << "enter a string to reverse and check if it is palindrome\n";
    std::cin >> str;
    std::cout << "reversed: " << reverseString(str) << "\n";
    if (isPalindrome(str)){
        std::cout << "palindrome\n";
    }else{
        std::cout << "not palindrome\n";
    }

    return 0;

}