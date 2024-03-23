#include "queue.h"
#include <iostream>
#include <string> 


queue::queue(const queue& q) : queue_size(q.queue_size), front(nullptr), back(nullptr){
    node* buf = q.front;

    while(buf != nullptr){
        node* nnod = new node(buf->value);
        if (front == nullptr) {
            front = nnod;
            back = nnod;
        } else {
            back->next = nnod;
            back = nnod;
        }
        buf = buf->next;
    }
}

queue::queue(std::initializer_list<int> ilist) : queue_size(ilist.size()), front(nullptr), back(nullptr){
	for(auto i : ilist){
		node* nnod = new node(i);
		if(front == nullptr){
			front = nnod;
			back = nnod;
		} else {
			back->next = nnod;
			back = nnod;
		}
	}
}

queue& queue::operator=(const queue& q){
	if(this != &q){
		if(this->queue_size != 0){
		node* buf = front;
		while(buf != nullptr){
			node* buf0 = buf;
			buf = buf->next;
			delete buf0;
		}

		queue_size = 0;
		front =  nullptr;
		back = nullptr;
		}

    node* buf1 = q.front;

    while(buf1 != nullptr){
        node* nnod = new node(buf1->value);
        if (front == nullptr) {
            front = nnod;
            back = nnod;
        } else {
            back->next = nnod;
            back = nnod;
        }
        buf1 = buf1->next;
    }
	}
	return *this;
}

void queue::push(int val){
	node* nnod = new node(val);
	if (front == nullptr){
		front = nnod;
		back = nnod;
	} else {
		back->next = nnod;
		back = nnod;
	}
	queue_size++;
}

int queue::peek() const{
	if(queue_size == 0){
		throw std::runtime_error("queue is empty!");
	}
	return front->value;
}

void queue::pop(){
	if(queue_size == 0){
		throw std::runtime_error("queue is empty!");
	}
	node* buf = front;
	front = front->next;
	delete buf;
	if (front == nullptr){
		back = nullptr;
	}
	queue_size--;
}

void queue::clear(){

	node* buf = front;
	while(buf != nullptr){
		node* buf0 = buf;
		buf = buf->next;
		delete buf0;
	}

	queue_size = 0;
	front = nullptr;
	back = nullptr;
}

size_t queue::size() const{
	return queue_size;
}

bool queue::empty() const{
	return queue_size == 0;
}

queue::~queue(){
	clear();
}