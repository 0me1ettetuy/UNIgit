#include <iostream>
#include "timer.h"
#include "queue.h"


int main( int argc, char* argv [ ] ){

    queue st1;
    timer tmr;

    for (int i = 0; i < 120000000; i++){
            st1.push(i);
    }

    double duration = tmr.secs_since_start();

    std::cout << "Time taken to do pushes: " << duration << " seconds." << std::endl;
    
    return 0;

}

//stack
//0.945544 100
//0.132183
//0.256266
//0.458187
//0.507034
//0.563592
//0.906602
//0.962145
//1.02508

//queue
//0.550328
//1.07087
//1.62746
//2.16208
//2.68816
//3.36833
//4.05504
//4.35576