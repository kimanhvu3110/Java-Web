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
public class AccountController {

    public static ArrayList<Account> list = new ArrayList<>();

    public AccountController() {
    }

    public static ArrayList<Account> getList() {
        return list;
    }

    public static void setList(ArrayList<Account> list) {
        AccountController.list = list;
    }

    static void addAccount(Account acc) {
        list.add(acc);
    }

    static void showInfoAccount(Account acc) {
        acc.toString();
    }

    //edit by number
    static void editAccount(String number) {
    }
}
