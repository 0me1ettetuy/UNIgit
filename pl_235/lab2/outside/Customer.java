package outside;

import banking_system.ATM;
import banking_system.Bank;

public class Customer {
    private Bank bank;
    private ATM atm;
    private int id;

    public Customer(Bank bank, ATM atm){
        this.bank = bank;
        this.atm = atm;
    }

    public void openAccount(){
        id = bank.createAccount();
    }

    public void depositMoney(int amount){
        atm.LoginToAccount(id);
        atm.deposit(amount);
        atm.logout();
    }

    public void withdrawMoney(int amount){
        atm.LoginToAccount(id);
        atm.withdraw(amount);
        atm.logout();
    }

    public int checkBalance(){
        atm.LoginToAccount(id);
        int balance = atm.getBalance();
        atm.logout();
        return balance;
    }
}
