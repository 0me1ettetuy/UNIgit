package expressions;

import java.util.Map;

import mini_splat.RunException;

public class BinaryOperation extends Expression{
    private Expression first, second;
    private char op;

    public BinaryOperation(Expression first, char op, Expression second){
        this.first = first;
        this.second = second;
        this.op = op;
    }

    @Override
    public int computeValue(Map<String, Integer> varMap) throws RunException {
        int frst = first.computeValue(varMap);
        int scnd = second.computeValue(varMap);
        switch (op){
            case '+':
                return frst + scnd;
            case '-':
                return frst - scnd;
            case '*':
                return frst * scnd;
            case '/':
                if(scnd == 0){
                    throw new RunException("Can not divide by zero...");
                }
                return frst / scnd;
            default:
                throw new RunException("There is no such operation...");
                
        }
    }

    @Override
    public String toString() {
        return first.toString() + ' ' + op + ' ' + second.toString();
    }
    
}
