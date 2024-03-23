package inventory;
import java.util.Random;
import java.util.ArrayList;

public class Inventory {
    protected ArrayList<Item> inventory;

    public Inventory(){
        inventory = new ArrayList<>();
    }

    public void generate(int max_item){
        Random rand = new Random();

        for(int i = 0; i < max_item; i++){
            int type = rand.nextInt(4);
            int power = rand.nextInt(20);
            switch (type) {
                case 0:
                    inventory.add(new Poison(power + 1));
                    break;
                case 1:
                    inventory.add(new HealthPotion(power + 16));
                    break;
                case 2:
                    inventory.add(new Weapon(power + 6));
                    break;
                case 3:
                    inventory.add(new Armor(power + 16));
                    break;
            }
        }

    }
    public String toString(){
        StringBuilder out = new StringBuilder("Inventories: ");
        if(inventory.isEmpty()){
            out.append("Empty...");
            return out.toString();
        }
        out.append("\n");
        for(Item i : inventory){
            out.append("        "+ i.toString() + "\n");
        }
        return out.toString();
    }

}
