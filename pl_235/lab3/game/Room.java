package game;
import actors.Actor;
import actors.Player;
import actors.Enemy;
import java.util.ArrayList;
import java.util.Random;
import inventory.Inventory;
import inventory.Relicts;

public class Room {
    private int row;
    private int column;
    private ArrayList<Actor> actors;
    //private Inventory relicts;
    private Relicts relicts;

    public Room(int row, int column){
        this.row = row;
        this.column = column;
        actors = new ArrayList<>();
        //relicts = new Inventory();
        relicts = new Relicts();
    }

    public void addRelicts(){
        Random rand = new Random();
        //Inventory relicts = new Inventory();
        Relicts relicts = new Relicts();
        relicts.generate(rand.nextInt(8));
        this.relicts = relicts;
    }

    public void addPlayer(Player player){
        actors.add(player);
    }

    public void addEnemy(){
        Random rand = new Random();
        Inventory enemy_inventory = new Inventory();
        enemy_inventory.generate(rand.nextInt(5) + 1);
        actors.add(new Enemy(enemy_inventory));
    }

    public String toString(){
        StringBuilder out  = new StringBuilder("room(" + row + " " + column + "):\n");
        out.append(relicts.toString() + "\n");
        for(Actor i : actors){
            out.append(i.toString() + "\n");
        }
        return out.toString();
    }
}
