import actors.Player;
import inventory.Inventory;

public class Main {

    public static void main(String[] args) {
        Inventory inv = new Inventory();
        inv.generate(7);
        Player player = new Player(inv);
        Game game = new Game(5, 5, 12, player);
        game.loadGame();
        game.printMap();
    }

}
