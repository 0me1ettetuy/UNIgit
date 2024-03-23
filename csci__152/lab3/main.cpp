#include <iostream>
#include "ticket.h" 

int main() {
    Queue* queue = new Queue();
    const int MAX_QUEUE_SIZE = 10;

    // Test: Adding customers
    newCustomer(queue, 1, "John");
    newCustomer(queue, 2, "Jane");
    newCustomer(queue, 3, "Jim");

    // Test: Buying tickets for each customer
    for (int i = 1; i <= 3; i++) {
        Customer* customer = queue->peek();
        buyTicket(customer, i, "Paris", 200.0 * i);
        buyTicket(customer, i+1, "London", 150.0 * i);
        buyTicket(customer, i+2, "Berlin", 100.0 * i);

        // Print Receipt and Serve Customer
        printReceipt(customer);
        serveCustomer(queue);
    }

    // Test: Try serving a customer when there are no customers
    try {
        serveCustomer(queue);
    } catch(const std::exception& e) {
        std::cerr << e.what() << '\n';
    }

    // Test: Adding more customers than queue can handle
    for(int i = 4; i <= MAX_QUEUE_SIZE+1; i++) {
        try {
            newCustomer(queue, i, "Customer" + std::to_string(i));
        } catch(const std::exception& e) {
            std::cerr << e.what() << '\n';
        }
    }

    // Free memory
    delete queue;

    return 0;
}

