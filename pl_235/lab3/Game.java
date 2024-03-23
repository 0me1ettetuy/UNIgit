import game.GameMap;
import actors.Player;

public class Game {
    private GameMap map;
    private Player player;

    public Game(int map_row, int map_column, int max_enemy, Player player){
        map = new GameMap(map_row, map_column, max_enemy);
        this.player = player;
    }

    public void loadGame(){
        map.loadRooms();
        map.loadPlayer(player);
    }

    public void printMap(){
        System.out.println(map.printMap());
    }
}
