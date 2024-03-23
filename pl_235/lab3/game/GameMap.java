package game;
import java.util.Random;
import actors.Player;

public class GameMap {
    private Room[][] rooms;
    private int map_row, map_column;
    private int max_enemy = 0;

    public GameMap(int map_row, int map_column, int max_enemy){
        rooms = new Room[map_row][map_column];
        this.map_row = map_row;
        this.map_column = map_column;
        this.max_enemy = max_enemy;
        for(int i = 0; i < map_row; i++){
            for(int j = 0; j < map_column; j++){
                rooms[i][j] = new Room(i, j);
            }
        }
    }

    public void loadPlayer(Player player){
        Random rand = new Random();
        int rand_row = rand.nextInt(map_row);
        int rand_column = rand.nextInt(map_column);
        rooms[rand_row][rand_column].addPlayer(player);
    }

    public void loadRooms(){
        Random rand = new Random();
        for(int i = 0; i < max_enemy; i++){
            int rand_row = rand.nextInt(map_row);
            int rand_column = rand.nextInt(map_column);
            rooms[rand_row][rand_column].addEnemy();
            rooms[rand_row][rand_column].addRelicts();
        }
    }

    public String printMap(){
        StringBuilder out = new StringBuilder("");
        for(int i = 0; i < map_row; i++){
            for(int j = 0; j < map_column; j++){
                out.append("_________________________________________________________________________________________________\n");
                out.append(rooms[i][j].toString());
                out.append("_________________________________________________________________________________________________\n");
            }
            //out.append("\n");
        }
        return out.toString();
    }
}
