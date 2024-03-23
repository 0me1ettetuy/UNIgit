package expressions;

import java.util.Map;

import mini_splat.RunException;

public class IntegerConstant extends Expression{

    private int val;

    public IntegerConstant(int val){
        this.val = val;
    }


    @Override
    public int computeValue(Map<String, Integer> varMap) throws RunException {
        return val;
    }

    @Override
    public String toString() {
        return String.valueOf(val);
    }
}
