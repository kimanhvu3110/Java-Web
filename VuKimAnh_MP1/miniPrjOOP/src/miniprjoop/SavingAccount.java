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
public class SavingAccount extends Account {

    private static String account_title = "Saving Account with 10% interest";
    private String status;
    private float interest = (this.getBalance() * 10) / 100;

    public SavingAccount() {
        super();
    }

    public SavingAccount(int ID, String status, String number, float balance,
            String description, ArrayList<Customer> list) {
        super(number, balance, description, ID, list);
        this.status = status;
        this.interest = (this.getBalance() * 10) / 100;
    }

    public String getAccount_title() {
        return account_title;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getInterest() {
        return interest;
    }
        

    public void setInterest() {
        this.interest = (this.getBalance() * 10) / 100;
    }

    @Override
    public String toString() {
        return account_title +": Customer: " +this.getCustomer().getName()+ " , number: " + this.getNumber()
                + ", status= " + status + ", interest= " + interest ;
    }

}
