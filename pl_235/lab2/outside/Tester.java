package outside;

import banking_system.ATM;
import banking_system.Bank;

public class Tester {
    public static void main(String[] args) {
        Bank bank = new Bank();
        Bank bank2 = new Bank();
        ATM atm1 = new ATM();
        ATM atm2 = new ATM();
        ATM atm3 = new ATM();
        bank.attachATM(atm1);
        bank.attachATM(atm2);
        bank2.attachATM(atm3);

        Customer cust1 = new Customer(bank, atm1);
        Customer cust2 = new Customer(bank, atm2);
        Customer cust3 = new Customer(bank2, atm3);
        Customer cust4 = new Customer(bank2, atm3);

        cust1.openAccount();
        cust2.openAccount();
        cust3.openAccount();
        cust4.openAccount();

        cust1.depositMoney(155);
        cust2.depositMoney(312);

        cust1.withdrawMoney(38);
        cust2.withdrawMoney(56);

        System.out.println("Cust1 balance: " + cust1.checkBalance());
        System.out.println("Cust2 balance: " + cust2.checkBalance());

        

        cust3.depositMoney(980);

        cust3.withdrawMoney(565);

        System.out.println("Cust3 balance: " + cust3.checkBalance());        
        

        cust4.depositMoney(1506);
        cust4.withdrawMoney(12);

        System.out.println("Cust4 balance: " + cust4.checkBalance());

        cust4.withdrawMoney(27);

        System.out.println("Cust3 balance: " + cust3.checkBalance());
        System.out.println("Cust4 balance: " + cust4.checkBalance());
    
    }
}
