#include <iostream>
#include <vector>
#include <string>

class Book {
private:
    std::string title;
    std::string author;
    int publicationYear;

public:
    Book(std::string title, std::string author, int publicationYear) : title(title), author(author), publicationYear(publicationYear){
    }

    std::string gettitle() const {
        return title;
    }

    std::string getauthor() const {
        return author;
    }

    int getyear() const {
        return publicationYear;
    }
};

class Library {
private:
    std::vector<Book> books;

public:
    void addBook(Book book) {
        books.push_back(book);
    }
    
    void removeBook(std::string title) {
        for(auto i = books.begin(); i != books.end(); i++){
            if(i->gettitle() == title){
                books.erase(i);
                break;
            }
        }
    }
    
    void printBooks() {
        std::cout << "book list:" << "\n";
        for (auto i = books.begin(); i != books.end(); i++){
            std::cout << "title:" << i->gettitle() << "\n";
            std::cout << "author: " << i->getauthor() << "\n";
            std::cout << "publ_year: " << i->getyear() << "\n";
            std::cout << "\n";
        }
    }
};

// Vector operations

std::vector<int> getNumbers(){
    int num;
    std::cout << "enter nums\n";
    std::cin >> num;
    std::vector<int> nums; 
    while( num != -1 ){
        nums.push_back(num);
        std::cin >> num;
    }
    return nums;
}

int sum(const std::vector<int>& nums){
    int sum = 0;
    for (auto i = nums.begin(); i != nums.end(); i++){
        sum += *i;
    }
    return sum;
}

double average(const std::vector<int>& nums){
    int summa = sum(nums);
    double avg = static_cast<double>(summa) / nums.size();
    return avg;
}

// String operations

std::string reverseString(const std::string& stroka){
    std::string reversed;
    for (int i = 1; i != stroka.size() + 1; i++ ){
        reversed.push_back(stroka[stroka.size() - i]);
    }
    return reversed;
}

bool isPalindrome(const std::string& stroka){
    std::string polin = reverseString(stroka);
    if (polin == stroka){
        return true;
    }else{
        return false;
    }
}
