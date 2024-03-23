package inventory;

public class Armor extends Equipment{
    //private int defence_power;

    public Armor(int defence){
        super("Armor", defence);
        //defence_power = defence;
    }

    public String toString(){
        return "Armor: with defence_power: " + power;
    }
}
