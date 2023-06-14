/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package miniprjoop;

import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author black
 */
public class GetInput {

    static Scanner in = new Scanner(System.in);

    static int getChoice(int val1, int val2) {
        //Loop to re-input choice if can not return
        while (true) {
            System.out.print("> Choose: ");
            try {
                int choice = Integer.parseInt(in.nextLine());
                System.out.println();
                //Condition to compare input choice between 1 and 5
                if (choice >= val1 && choice <= val2) {
                    return choice;
                } else {
                    System.out.println("Please enter value between above choices");
                }
            } catch (NumberFormatException ex) {
                System.out.println("Choice is a number. Please input again");
            }
        }
    }

    static String getString(String msg) {
        // Loop to re-input
        while (true) {
            boolean check = true;
            System.out.print(msg);
            String string = in.nextLine().trim();
            // Condition check input into right format         
            if (string.isEmpty()) {
                System.out.println("Input is empty. Please input again");
            } else {
                System.out.println();
                return string;
            }
        }
    }

    static Float getAvailability(String msg) {

        //Loop to re-input choice if can not return
        while (true) {
            System.out.print(msg);
            try {
                String number = in.nextLine();
                if (number.equals("")) {
                    return null;
                }
                float availability = Float.parseFloat(number);
                // Condition input must be positive or 0 
                if (availability >= 0) {
                    System.out.println();
                    return availability;
                } else {
                    System.out.println("Availability must be 0 or positive");
                }
            } catch (NumberFormatException ex) {
                System.out.println("Availability is a number. Please input again");
            }
        }
    }

    static Integer getValueID(String msg, Bank bank) {
        //Loop to re-input choice if can not return
        while (true) {
            System.out.print(msg);
            try {
                String number = in.nextLine();
                if (number.equals("")) {
                }
                Integer availability = Integer.parseInt(number);
                // Condition input must be positive or 0 
                if (availability >= 0) {
                    ArrayList<Customer> list = bank.getCController().listC;
                    for (Customer c : list) {
                        if (availability == c.getID()) {
                            System.out.println();
                            return availability;
                        }
                    }
                    System.out.println("There is no customer's ID in bank system");
                } else {
                    System.out.println("Availability must be 0 or positive");
                }

            } catch (NumberFormatException ex) {
                System.out.println("Availability is a number. Please input again");
            }
        }
    }

    static String getAccountNumber(String msg, Bank bank) {
        // Loop to re-input
        while (true) {
            boolean check = true;
            System.out.print(msg);
            String string = in.nextLine().trim();
            // Condition check input into right format         
            if (string.isEmpty()) {
                System.out.println("Input is empty. Please input again");
            } else {
                ArrayList<Account> list = bank.getAController().list;
                for (Account a : list) {
                    if (string.equals(a.getNumber())) {
                        System.out.println("Number is existed ! Please enter new number");
                        check = false;
                    }
                }
                if (check == true) {
                    System.out.println();
                    return string;
                }
            }

        }
    }
}
