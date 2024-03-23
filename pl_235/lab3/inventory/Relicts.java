package inventory;

public class Relicts extends Inventory {

    public Relicts() {
        super();
    }

    public void generate(int max_item){
        super.generate(max_item);
    }

    @Override
    public String toString() {
        StringBuilder out = new StringBuilder("Room relicts: ");
        if (inventory.isEmpty()) {
            out.append("Empty...");
            return out.toString();
        }
        out.append("\n");
        for (Item i : inventory) {
            out.append("        " + i.toString() + "\n");
        }
        return out.toString();
    }
}
