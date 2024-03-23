package expressions;

import java.util.Map;

import mini_splat.RunException;

public class VariableExpr extends Expression{
    private String var;

    public VariableExpr(String var){
        this.var = var;
    }

    @Override
    public int computeValue(Map<String, Integer> varMap) throws RunException {
        Integer val = varMap.get(var);
        if(val == null){
            throw new RunException("Variable " + var + " has no value assigned yet...");
        }
        return val;
    }

    @Override
    public String toString() {
        return var;
    }
    
}
