#include <iostream>
#include <vector>
#include <string> 

using namespace std;

int main( int argc, char* argv [ ] ){

    std::vector<int> x = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    std::vector<int> y = x;

    y[5] = 12;

    for( size_t i = 0; i != x.size(); ++i )
        std::cout << i << ": " << x[i] << " " << y[i] << "\n";

    return 0;

}