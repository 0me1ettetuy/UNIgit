package inventory;

abstract class Item {
    private String name;
    protected int power;

    public Item(String name, int power) {
        this.name = name;
        this.power = power;
    }
    public String toString(){
        return name + ": with magic_power: " + power;
    }
}
