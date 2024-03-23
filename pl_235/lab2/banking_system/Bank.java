package banking_system;

import java.util.ArrayList;

public class Bank {
    private ArrayList<Account> acc;
    private ArrayList<ATM> atm;

    public Bank(){
        acc = new ArrayList<>();
        atm = new ArrayList<>();
    }

    public int createAccount(){
        int id = acc.size();
        Account newacc = new Account(id);
        acc.add(newacc);
        return id;
    }

    public void attachATM(ATM atm){
        this.atm.add(atm);
        atm.setBank(this);
    }

    public int accessAcctInfo(int acctNum){
        if (acctNum >= 0 || acctNum < acc.size()){
            return acc.get(acctNum).getBalance();
        }else{
            throw new IllegalArgumentException("There is no such account...");
        }
    }

    public void updateAcctBal(int acctNum, int diff){
        if (acctNum >= 0 || acctNum < acc.size()){
            int balance = acc.get(acctNum).getBalance();
            if(balance + diff < 0){
                throw new ArithmeticException("Not enought money...");
            }
            acc.get(acctNum).updBalance(diff);
        }else{
            throw new IllegalArgumentException("There is no such account...");
        }
    }
}
