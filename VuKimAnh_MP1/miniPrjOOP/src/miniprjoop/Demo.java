/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package miniprjoop;

/**
 *
 * @author black
 */
public class Demo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        // Loop to re-run program until exit
        Bank bank = new Bank(101, "Asian", "56 Hang Ma, HN");
        BankManagement.customerInBank(bank);
        BankManagement.accountInBank(bank);
        while (true) {
            // Display menu
            BankManagement.displayMenu(bank);
            // Input a choice from menu
            int choice = GetInput.getChoice(1,6);
            switch (choice) {
                //Choice 1: Add a customer
                case 1:
                    BankManagement.addCustomer(bank);
                    break;
                // Choice 2: Add Account
                case 2:
                    BankManagement.openAccount(bank);
                    break;
                // Choice 3: Search account
                case 3:
                    BankManagement.searchAccount(bank);
                    break;
                // Choice 4: Deposit Account
                case 4:
                    BankManagement.depositAccount(bank);
                    break;
                // Choice 5: Withdraw account
                case 5:
                    BankManagement.withdrawAccount(bank);
                    break;
                // Choice 6: checkBalance
                case 6:
                    BankManagement.checkBalanceAccount(bank);
                    break;
                // Choice 7: Exit
                case 7:
                    System.exit(0);
            }
        }
    }

}
