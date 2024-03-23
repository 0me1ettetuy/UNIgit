package statements;

import java.util.List;
import java.util.Map;

import mini_splat.RunException;
import expressions.Expression;

public class Assignment extends Statement{
    private String var;
    private Expression expr;

    public Assignment(String var, Expression expr){
        this.var = var;
        this.expr = expr;
    }


    @Override
    public void execute(Map<String, Integer> varMap, List<Integer> output) throws RunException {
        int val = expr.computeValue(varMap);
        varMap.put(var, val);
    }

    @Override
    public String toString() {
        return var + " := " + expr.toString() + "\n";
    }
    
}
