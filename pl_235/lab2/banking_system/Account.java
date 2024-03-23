package banking_system;

public class Account {
    private int id;
    private int balance;


    protected Account(int id){
        this.id = id;
        balance = 0;
    }

    protected void updBalance(int diff){
        balance += diff;
    }

    protected int getBalance(){
        return balance;
    }
    protected int getId(){
        return id;
    }

}
