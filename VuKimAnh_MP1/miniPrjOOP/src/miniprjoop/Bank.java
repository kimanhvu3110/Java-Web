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
public class Bank {
    private int code;
    private String name;
    private String address;
    private CustomerController CController;
    private AccountController AController;

    public CustomerController getCController() {
        return CController;
    }

    public void setCController(CustomerController CController) {
        this.CController = CController;
    }

    public AccountController getAController() {
        return AController;
    }

    public void setAController(AccountController AController) {
        this.AController = AController;
    }  

    public Bank(int code, String name, String address) {
        this.code = code;
        this.name = name;
        this.address = address;
    }

    public Bank() {
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
