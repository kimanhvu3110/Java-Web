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
public class CurrentAccount extends Account {

    private static String account_title = "Current Account";
    private String status;

    public CurrentAccount(int ID, String status, String number,
            float balance, String description, ArrayList<Customer> list) {
        super(number, balance, description, ID, list);
        this.status = status;
    }

    public CurrentAccount() {
        super();
    }

    public CurrentAccount(String status) {
        this.status = status;
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

    @Override
    public String toString() {
        return account_title + ": Customer: " + this.getCustomer().getName() + ", number: " + this.getNumber()
                + ", status= " + status + ", balance= " + this.getBalance() ;
    }
}
