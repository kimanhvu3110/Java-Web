/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package miniprjoop;

import java.util.ArrayList;

/**
 *
 * @author black
 */
public class BankManagement {

    static void displayMenu(Bank bank) {
        System.out.println();
        System.out.println("========= " + bank.getName() + " Bank Management =========");
        System.out.println("1. Add Customer");
        System.out.println("2. Add Account for existed Customer");
        System.out.println("3. Search Account from Bank");
        System.out.println("4. Deposit amount of money for an account");
        System.out.println("5. Withdraw amount of money for an account");
        System.out.println("6. Check balance of an account");
        System.out.println("7. Exit");
    }

    static void customerInBank(Bank bank) {
        Customer cus1 = new Customer("Mila Micheal", "email1@gmail.com", "09822", "mila34", "HCM", "001");
        Customer cus2 = new Customer("John Smith", "email2@gmail.com", "08773", "john03", "HN", "002");
        Customer cus3 = new Customer("Kavin Klein", "email3@gmail.com", "07034", "kavin43", "HN", "003");
        Customer cus4 = new Customer("Mai Nguyen", "email4@gmail.com", "09864", "mai77", "BG", "004");
        bank.getCController().addCustomer(cus1);
        bank.getCController().addCustomer(cus2);
        bank.getCController().addCustomer(cus3);
        bank.getCController().addCustomer(cus4);
    }

    static void accountInBank(Bank bank) {
        ArrayList<Customer> list = bank.getCController().listC;
        Account acc1 = new SavingAccount(3, "active", "3000", 5000, "1 month", list);
        Account acc2 = new CurrentAccount(3, "active", "4000", 40000, "transfer", list);
        Account acc3 = new SavingAccount(1, "active", "3001", 56000, "3 month", list);
        bank.getAController().addAccount(acc1);
        bank.getAController().addAccount(acc2);
        bank.getAController().addAccount(acc3);
    }

    static void openAccount(Bank bank) {
        System.out.println();
        int cusID = GetInput.getValueID("Enter customer ID: ", bank);
        System.out.println("               Please choose type of bank account");
        System.out.println("1. Saving Account                          2.Current Account");
        int choice = GetInput.getChoice(1, 2);
        switch (choice) {
            case 1:
                String number = GetInput.getAccountNumber("Enter account number: ", bank);
                float balance = GetInput.getAvailability("Enter balance money: ");
                if (balance <= 0) {
                    System.out.println("To open saving account, balance should be large than 0");
                    return;
                }
                String description = GetInput.getString("Enter description for account: ");
                String status = GetInput.getString("Enter status of account: ");
                SavingAccount acc = new SavingAccount(cusID, status, number, balance, description, bank.getCController().listC);
                bank.getAController().addAccount(acc);
                break;

            case 2:
                String number1 = GetInput.getString("Enter number account: ");
                float balance1 = GetInput.getAvailability("Enter balance money: ");
                String description1 = GetInput.getString("Enter description for account: ");
                String status1 = GetInput.getString("Enter status of account: ");
                Account acc1 = new CurrentAccount(cusID, status1, number1, balance1, description1, bank.getCController().listC);
                bank.getAController().addAccount(acc1);
                break;

            default:
                System.out.println("No choice for that");
                break;
        }
        System.out.println("OPEN ACCOUNT SUCCESSFULLY!!!");
    }

    static void searchAccount(Bank bank) {
        ArrayList<Account> list = bank.getAController().list;
        if (list.size() == 0) {
            System.out.println("No account in bank");
            return;
        }
        while (true) {
            System.out.println();
            String search = GetInput.getString("Enter account number to search: ");
            int dem = 0;
            for (Account a : list) {
                if (a.getNumber().contains(search)) {
                    System.out.println(a.toString());
                    dem++;
                }
            }
            if (dem == 0) {
                System.out.println("There is no result !!!");
            } else {
                System.out.println("There is " + dem + " results");
            }
            String enter = GetInput.getString("CONTINUE? Y/N ");
            if (enter.toUpperCase().equals("N")) {
                return;
            } else {
                continue;
            }
        }
    }

    static void depositAccount(Bank bank) {
        ArrayList<Account> list = bank.getAController().list;
        if (list.size() == 0) {
            System.out.println("No account in bank");
            return;
        }
        while (true) {
            System.out.println();
            String number = GetInput.getString("Enter account number to deposit: ");
            for (Account a : list) {
                if (number.equals(a.getNumber())) {
                    System.out.println(a.toString());
                    float depositNumber = GetInput.getAvailability("Enter amount money to deposit: ");
                    float sum = a.getBalance() + depositNumber;
                    a.setBalance(sum);
                    if (a instanceof SavingAccount) {
                        ((SavingAccount) a).setInterest();
                    }
                    System.out.println("Deposit successfully !");
                    System.out.println(a.toString());
                    return;
                } else {
                    System.out.println("NO account number valid !!!");
                    break;
                }
            }
            String enter = GetInput.getString("CONTINUE? Y/N ");
            if (enter.toUpperCase().equals("N")) {
                return;
            } else {
                continue;
            }
        }
    }

    static void withdrawAccount(Bank bank) {
        ArrayList<Account> list = bank.getAController().list;
        if (list.size() == 0) {
            System.out.println("No account in bank");
            return;
        }
        while (true) {
            System.out.println();
            String number = GetInput.getString("Enter account number to withdraw: ");
            for (Account a : list) {
                if (number.equals(a.getNumber())) {
                    System.out.println(a.toString());
                    float withdrawNumber = GetInput.getAvailability("Enter amount money to withdraw: ");
                    if (withdrawNumber < a.getBalance()) {
                        float sum = a.getBalance() - withdrawNumber;
                        a.setBalance(sum);
                        if (a instanceof SavingAccount) {
                            ((SavingAccount) a).setInterest();
                        }
                        System.out.println("Withdraw successfully !");
                        return;
                    } else {
                        System.out.println("Can not withdraw cause amount of account is not enough");
                        continue;
                    }
                } else {
                    System.out.println("NO account number valid !!!");
                    break;
                }
            }
            String enter = GetInput.getString("CONTINUE? Y/N ");
            if (enter.toUpperCase().equals("N")) {
                return;
            } else {
                continue;
            }
        }
    }

    static void checkBalanceAccount(Bank bank) {
        ArrayList<Account> list = bank.getAController().list;
        if (list.size() == 0) {
            System.out.println("No account in bank");
            return;
        }
        while (true) {
            System.out.println();
            int dem = 0;
            String number = GetInput.getString("Enter account number to check balance: ");
            for (Account a : list) {
                if (number.equals(a.getNumber())) {
                    dem++;
                    System.out.println("Customer: "+a.getCustomer().getName()+
                            ", Account Number: " + a.getNumber() + ", BALANCE: " + a.getBalance());
                    return;
                }
            }
            if (dem == 0) {
                System.out.println("NO account number valid !!!");
            }
            String enter = GetInput.getString("CONTINUE? Y/N ");
            if (enter.toUpperCase().equals("N")) {
                return;
            } else {
                continue;
            }
        }
    }

    static void addCustomer(Bank bank) {
        String name = GetInput.getString("Enter customer's name: ");
        String email = GetInput.getString("Enter customer's email: ");
        String phoneNo = GetInput.getString("Enter customer's phone NO: ");
        String username = GetInput.getString("Enter customer's username: ");
        String address = GetInput.getString("Enter customer's address: ");
        String cardNo = GetInput.getString("Enter customer's cardNo: ");
        Customer cus = new Customer(name, email, phoneNo, username, address, cardNo);
        bank.getCController().addCustomer(cus);
        System.out.println("Add customer successfully !");
        System.out.println("New Customer's info: "+cus.toString());
    }

}
