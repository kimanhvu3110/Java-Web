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
abstract public class Account {

    private String number;
    private float balance = 0;
    private String description;
    private Customer customer;

    public Account() {
    }

    public Account(String number, float balance, String description, int ID,
            ArrayList<Customer> control) {
        this.number = number;
        this.balance = balance;
        this.description = description;
        for (Customer c : control) {
            if (c.getID() == ID) {
                this.customer = c;
                break;
            }
        }
    }

    public Account(String number, String description, Customer customer) {
        this.number = number;
        this.description = description;
        this.customer = customer;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public float getBalance() {
        return balance;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    abstract public String toString();

}
