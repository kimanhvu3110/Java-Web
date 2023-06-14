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
public class CustomerController {
    public static ArrayList<Customer> listC = new ArrayList<>();

    static void addCustomer(Customer cus) {
        listC.add(cus);
    }
    
    //edit by ID
    static void editCustomer(int ID){        
    }
    
    //remove by ID
    static void removeCustomer(int ID){
        for(Customer customer:listC){
            if(customer.getID() == ID){
                listC.remove(customer);
            }
        }
        
    }
    
    //search by ID
    static void searchCustomer(int ID){
        for(Customer customer: listC){
            if(customer.getID() == ID){
                System.out.println(customer.toString());
            }
        }
    }
}
