/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author black
 */
public class Student {
    private int id;
    private String rollNB;
    private String firstName;
    private String midName;
    private String lastName;

   public Student(int id, String rollNB, String firstName, String lastName) {
        this.id = id;
        this.rollNB = rollNB;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public Student(int id, String rollNB, String firstName, String midName, String lastName) {
        this.id = id;
        this.rollNB = rollNB;
        this.firstName = firstName;
        this.midName = midName;
        this.lastName = lastName;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRollNB() {
        return rollNB;
    }

    public void setRollNB(String rollNB) {
        this.rollNB = rollNB;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public Student(int id) {
        this.id = id;
    }

    public String getMidName() {
        return midName;
    }

    public void setMidName(String midName) {
        this.midName = midName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    
}
