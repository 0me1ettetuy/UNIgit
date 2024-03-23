package statements;

import java.util.List;
import java.util.Map;

import mini_splat.RunException;
import expressions.Expression;

public class IfPosStatement extends Statement{
    private Expression cond;
    private List<Statement> stmnts;

    public IfPosStatement(Expression cond, List<Statement> stmnts){
        this.cond = cond;
        this.stmnts = stmnts;
    }

    @Override
    public void execute(Map<String, Integer> varMap, List<Integer> output) throws RunException {
        int condval = cond.computeValue(varMap);
        if(condval > 0){
            for (Statement i : stmnts){
                i.execute(varMap, output);
            }
        }
    }

    @Override
    public String toString() {
        StringBuilder str = new StringBuilder("if_pos " + cond.toString() + "\n");
        for (Statement i : stmnts){
            str.append(i.toString());
        }
        str.append("end\n");
        return str.toString();
    }
    
}
