public class Animal {

    private String name, food, env;
    private double weight, qfood, aenv;

    public Animal(String nm, double wght, String fd, double qfd, String env, double aenv){
        this.name = nm;
        this.food = fd;
        this.env = env;
        this.weight = wght;
        this.qfood = qfd;
        this.aenv = aenv;
    }
    public String name(){
        return this.name;
    }

    public String food(){
        return this.food;
    }
    public double qfood(){
        return this.qfood;
    }

    public String env(){
        return this.env;
    }

    public double aenv(){
        return this.aenv;
    }

    public String toString(){
        return "Name: " + name + "\nWeight: " + weight
        + "\nEats " + qfood + " kg of " + food
        + "\nlives in " + aenv + " m^2 of " + env + "\n";
    }

}

class Giraffe extends Animal{
    public Giraffe(String name, double weight){
        super(name, weight, "Leaves", 300.0, "Grassland", 1500.0);
    }
}

class Tiger extends Animal{
    public Tiger(String name, double weight){
        super(name, weight, "Meat", 200.0, "Grassland", 1000.0);
    }
}

class Penguin extends Animal{
    public Penguin(String name, double weight){
        super(name, weight, "Fish", 15.0, "Water", 20.0);
    }
}
