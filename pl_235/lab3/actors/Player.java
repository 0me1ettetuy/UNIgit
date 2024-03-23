package actors;

import inventory.Inventory;

public class Player extends Actor{

    public Player(Inventory inventory) {
        super(inventory);
    }

    public String toString(){
        StringBuilder out = new StringBuilder("Type: Player\n");
        out.append(inventory.toString());
        return out.toString();
    }
    
}
