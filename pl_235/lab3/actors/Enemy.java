package actors;

import inventory.Inventory;

public class Enemy extends Actor{

    public Enemy(Inventory inventory) {
        super(inventory);
    }

    public String toString(){
        StringBuilder out = new StringBuilder("Type: Enemy\n");
        out.append(inventory.toString());
        return out.toString();
    }
    
}
