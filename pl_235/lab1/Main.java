public class Main {

    public static void main(String[] args) {
        Zoo myZoo = new Zoo();

        Animal lion = new Animal("Lion", 190.0, "Meat", 5.0, "Savannah", 200.0);
        Animal elephant = new Animal("Elephant", 5000.0, "Plants", 50.0, "Jungle", 1000.0);

        myZoo.addAnimal(lion);
        myZoo.addAnimal(elephant);

        System.out.println("Number of Animals in the Zoo: " + myZoo.numOfAnimals());
        System.out.println(myZoo);
    }


    //public static String method(String str){
        //System.out.println("#1" + str);
        //return ("#1 " + str);
    //}
    //public static void main(String[] args) {



        //Person pet = new Person("Parker");
        //System.out.println(pet);



        //String name = new String("joe mama");
        //System.out.println(name);
        //System.out.println("nice");
        //System.out.println(method(name));
    //}
}
