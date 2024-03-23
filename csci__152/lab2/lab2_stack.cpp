#include <iostream>
#include <stack>
#include <string>

// 1. Balanced Parentheses Checker

bool areParenthesesBalanced(std::string expr) {
    std::stack<char> s;
    
    for (int i=0; i<expr.length(); i++) {
       if (expr[i] == '(' || expr[i] == '{' || expr[i] == '['){
            s.push(expr[i]);
        }else if (expr[i] == ')' || expr[i] == '}' || expr[i] == ']')
        {
            if (s.empty() || (expr[i] == ')' && s.top() != '(') ||
                (expr[i] == '}' && s.top() != '{') ||
                (expr[i] == ']' && s.top() != '[')){
                    return false;
                }
            s.pop();

        }
    }
    return (s.empty());
}

// 2. Postfix Expression Evaluator

int evaluatePostfixExpression(std::string expr) {
    std::stack<int> s;
    std::string str = "0123456789";
    std::string op = "+-*/";
    int fst = 0, scd = 0;
    for (int i=0; i<expr.length(); i++) {
        if(str.find(expr[i]) != std::string::npos){
            s.push(static_cast<int>(expr[i]) - '0');
        }else if(op.find(expr[i]) != std::string::npos){
            scd = s.top();
            //std::cout << scd << "\n";
            s.pop();
            fst = s.top();
            //std::cout << fst << "\n";
            s.pop();
            switch (expr[i]){
                case '+':
                    s.push(fst + scd);
                    break;
                case '-':
                    s.push(fst - scd);
                    break;
                case '*':
                    s.push(fst * scd);
                    break;
                case '/':
                    s.push(fst / scd);
                    break;
            }
        }
    }
    return s.top();
}

// 3. Text-based browser history

class BrowserHistory {
private:
    std::stack<std::string> backStack;
    std::stack<std::string> forwardStack;

public:
    // Visit a URL
    void visit(std::string url) {
        backStack.push(url);
        while(!forwardStack.empty()) {
            forwardStack.pop();
        }
    }

    // Go back
    std::string back() {
        if(backStack.empty()) {
            throw std::runtime_error("There is no way back, bro...");
            return 0;
        } else {
            forwardStack.push(backStack.top());
            backStack.pop();
            return backStack.top();
        }
    }

    // Go forward
    std::string forward() {
        if(forwardStack.empty()) {
            throw std::runtime_error("You have pushed the limits...");
            return 0;
        } else {
            backStack.push(forwardStack.top());
            forwardStack.pop();
            return backStack.top();
        }
    }
};


int main( int argc, char* argv [ ] ){

    std::string expr = "{()}[]";
    std::string ex2 = "45+62-*";

    if (areParenthesesBalanced(expr))
        std::cout << "Balanced \n";
    else
        std::cout << "Not Balanced \n";

    std::cout << evaluatePostfixExpression(ex2) << "\n";
    
    return 0;

}