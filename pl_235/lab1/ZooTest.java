public class ZooTest {
    public static void main(String[] args) {
        Zoo myZoo = new Zoo();

        Animal lion = new Animal("Lion", 170.0, "Meat", 7.0, "Reservoir", 500.0);
        Animal elephant = new Animal("Elephant", 4000.0, "Plants", 100.0, "Big_reservoir", 1500.0);

        myZoo.addAnimal(lion);
        myZoo.addAnimal(elephant);

        Animal giraffe = new Giraffe("Giraffe", 2000.0);
        Animal tiger = new Tiger("Tiger", 300.0);
        Animal penguin = new Penguin("Penguin", 27.0);
        Animal unicorn = new Animal("Unicorn", 270.0, "Skittles", 17.5, "Clouds", 2500.0);

        myZoo.addAnimal(penguin);
        myZoo.addAnimal(tiger);
        myZoo.addAnimal(giraffe);
        myZoo.addAnimal(unicorn);

        System.out.println("Number of Animals in the Zoo: " + myZoo.numOfAnimals());
        System.out.println(myZoo);

        System.out.println("Total Fish needed: " + myZoo.totalFoodNeeded("Fish"));
        System.out.println("Total Grassland needed: " + myZoo.totalSqMetersNeeded("Grassland"));
        System.out.println("Total Skittles needed: " + myZoo.totalFoodNeeded("Skittles"));
        System.out.println("Total Clouds needed: " + myZoo.totalSqMetersNeeded("Clouds"));

    }
}
