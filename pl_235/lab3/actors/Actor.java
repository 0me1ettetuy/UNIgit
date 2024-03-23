package actors;
import inventory.Inventory;

public class Actor {
    protected Inventory inventory;

    public Actor(Inventory inventory){
        this.inventory = inventory;
    }

}
