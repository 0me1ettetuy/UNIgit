package banking_system;

public class ATM {
    private int id = -1;
    private Bank bank;

    public boolean LoginToAccount(int acctNum){
        bank.accessAcctInfo(acctNum);
        id = acctNum;
        return true;
    }

    public boolean deposit(int amount){
        if(id < 0){
            return false;
        }
        bank.updateAcctBal(id, amount);
        return true;
    }

    public boolean withdraw(int amount){
        if(id < 0){
            return false;
        }
        bank.updateAcctBal(id, -amount);
        return true;
    }

    public int getBalance(){
        if(id < 0){
            return 0;
        }
        return bank.accessAcctInfo(id);
    }

    public void setBank(Bank bank){
        this.bank = bank;
    }

    public Bank getBank(){
        return bank;
    }

    public void logout(){
        id = -1;
    }
}
