package inventory;

public class HealthPotion extends Consumable{
    //private int healing_power;

    public HealthPotion(int healing){
        super("Health_Potion", healing);
        //healing_power = healing;
    }

    public String toString(){
        return "Helath_Potion: with helaling_power: " + power;
    }
}
