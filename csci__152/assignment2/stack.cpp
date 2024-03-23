#include "stack.h"
#include <iostream>
#include <string>


stack::stack(const stack& stk) : values(new int[stk.array_capacity]), stack_size(stk.stack_size), array_capacity(stk.array_capacity) {
    for (size_t i = 0; i < stack_size; i++) {
        values[i] = stk.values[i];
    }
}



stack::stack(std::initializer_list<int> ilist) : values(new int[ilist.size()]), stack_size(ilist.size()), array_capacity(ilist.size()){
	int *buf = values;
	for (auto i: ilist){
		*buf = i;
		buf++;
	}
}

stack& stack::operator=(const stack& stk){
	if(this != &stk){
		stack_size = stk.stack_size;
		array_capacity = stk.array_capacity;
		delete[] values;
		values = new int[array_capacity];

		for (size_t i = 0; i < stack_size; i++){
			values[i] = stk.values[i];

		}
		
	}

	return *this;
}


void stack::push(int val){

	if(stack_size == array_capacity){
		array_capacity *= 2;
		int *nval = new int[array_capacity];
		
		for (size_t i = 0; i < stack_size; i++){
			nval[i] = values[i];
		}
		delete[] values;
		values = nval;
	}

	values[stack_size] = val;
	stack_size++;

}

int stack::peek() const{
	if (stack_size != 0){
		return values[stack_size - 1];
	}else{
		 throw std::runtime_error("Stack is empty!");
	}
}

void stack::pop(){
	if (stack_size != 0){
		stack_size--;
	}else{
		 throw std::runtime_error("Stack is empty!");
	}
}

void stack::clear(){
	delete[] values;
	values = new int[5];
	array_capacity = 5;
	stack_size = 0;
}

size_t stack::size() const{
	return stack_size;
}

bool stack::empty() const{
	return stack_size == 0;
}

stack::~stack(){
	delete[] values;
}