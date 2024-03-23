import java.util.ArrayList;

public class Zoo {
    private ArrayList<Animal> zoo;

    public Zoo(){
        zoo = new ArrayList<>();
    }

    public void addAnimal(Animal anml){
        zoo.add(anml);
    }

    public int numOfAnimals(){
        return zoo.size();
    }
    public double totalFoodNeeded(String fd){
        double out = 0;
        for (Animal z : zoo){
            if (z.food().equals(fd)){
                out += z.qfood();
            }
        }
        return out;
    }

    public double totalSqMetersNeeded(String env){
        double out = 0;
        for (Animal z : zoo){
            if (z.env().equals(env)){
                out += z.aenv();
            }
        }
        return out;
    }

    public String toString(){
        StringBuilder out = new StringBuilder("");
        for (Animal z : zoo){
            out.append(z.name() + "\n");
        }
        return out.toString();
        }
    }
