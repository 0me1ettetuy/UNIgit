package statements;

import java.util.List;
import java.util.Map;

import mini_splat.RunException;
import expressions.Expression;

public class OutputStatement extends Statement{
    private Expression expr;

    public OutputStatement(Expression expr){
        this.expr = expr;
    }

    @Override
    public void execute(Map<String, Integer> varMap, List<Integer> output) throws RunException {
        int val = expr.computeValue(varMap);
        output.add(val);
    }

    @Override
    public String toString() {
        return "output " + expr.toString() + "\n";
    }
    
}
