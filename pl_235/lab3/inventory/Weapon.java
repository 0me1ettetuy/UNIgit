package inventory;

public class Weapon extends Equipment{
    //private int attack_power;

    public Weapon(int attack){
        super("Weapon", attack);
        //attack_power = attack;
    }

    public String toString(){
        return "Weapon: with attack_power: " + power;
    }
}
