package inventory;

public class Poison extends Consumable{
    //private int destroy_power;

    public Poison(int destroy){
        super("Poison", destroy);
        //destroy_power = destroy;
    }

    public String toString(){
        return "Poison: with destroy_power: " + power;
    }
}
