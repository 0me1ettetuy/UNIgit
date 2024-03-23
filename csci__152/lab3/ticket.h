#include <iostream>
#include <string>
// QueueNode for Customer Queue
struct QueueNode {
    struct Customer* customer;
    struct QueueNode* next;
};

// Ticket structure 
struct Ticket {
    int ticketID;
    std::string destination;
    double price;
    struct Ticket* next;
};

// Queue Class
class Queue {
public:
    QueueNode* front, * rear;
    Queue() {
        this->front = this->rear = NULL;
    }

    bool isEmpty(){
        return front == nullptr;
    }
    bool isFull(int max){
        QueueNode* buf = front;
        int i = 0;
        while(buf != nullptr){
            buf = buf->next;
            i++;
        }
        return i >= max;
    } // max queue size to be defined in the main program
    
    void enqueue(Customer* customer){
        QueueNode* buf = new QueueNode();
        buf->customer = customer;
        buf->next = nullptr;
        if (isEmpty()){
            front = buf;
            rear = buf;
        }else{
            rear->next = buf;
            rear = buf;
        }
    }
    Customer* dequeue(){
        if(isEmpty()){
            throw std::runtime_error("Seems like queue is empty bro...");
        }
        Customer* cust = front->customer;
        QueueNode* buf = front;
        front = front->next;
        delete buf;
        return cust;
    }
    Customer* peek(){
        if(isEmpty()){
            throw std::runtime_error("Seems like queue is empty bro...");
        }
        return front->customer;
    }
};

// Customer Class
class Customer {
    int customerID;
    std::string name;
    Ticket* tickets;  // This pointer points to the first Ticket in the list
    public:
    Customer(int id, std::string name) {
        this->customerID = id;
        this->name = name;
        this->tickets = NULL;
    }

    void addTicket(int ticketID, std::string destination, double price){
        Ticket* buf = new Ticket();
        buf->ticketID = ticketID;
        buf->destination = destination;
        buf->price = price;
        buf->next = nullptr;
        if(tickets == nullptr){
            tickets = buf;
        }else{
            Ticket* buf0 = tickets;
            while (buf0->next != nullptr)
            {
                buf0 = buf0->next;
            }
            buf0->next = buf;            
        }

        //IAMHERE
    }
    void printTickets(){
        std::cout << "CustomerID: " << customerID << "\n";
        std::cout << "Customer name: " << name << "\n";
        std::cout << "TICKETS: " << "\n";
        Ticket* buf = tickets;
        while (buf != nullptr)
        {
            std::cout << "\n";
            std::cout << "  ticketID: " << buf->ticketID << "\n";
            std::cout << "  destination: " << buf->destination << "\n";
            std::cout << "  ticketPrice: " << buf->price << "\n";
            std::cout << "\n";
            buf = buf->next;
        }      
    }
};

// Methods for handling the Ticket Counter operations
void newCustomer(Queue* queue, int id, std::string name){
    Customer* cust = new Customer(id, name);
    queue->enqueue(cust);
}
void serveCustomer(Queue* queue){
    queue->dequeue();
}
void buyTicket(Customer* customer, int ticketID, std::string destination, double price){
    customer->addTicket(ticketID, destination, price);
}
void printReceipt(Customer* customer){
    customer->printTickets();
}

