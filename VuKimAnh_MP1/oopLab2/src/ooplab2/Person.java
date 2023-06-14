/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ooplab2;

/**
 *
 * @author black
 */
abstract public class Person {

    private int ID;
    private static int LAST_ID = 0;
    private String Name;

    public Person() {
        this.ID = ++LAST_ID;
    }

    public Person(String Name) {
        this.ID = ++LAST_ID;
        this.Name = Name;
    }

    public String getName() {
        return Name;
    }

    public int getID() {
        return ID;
    }

    static int getMaxID() {
        return LAST_ID;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    abstract public String toString();
}
