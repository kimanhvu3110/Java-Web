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
public class Instructor {
    private int insId;
    private String insFirstName;
    private String insMidName;
    private String insLastName;

    public Instructor(int insId) {
        this.insId = insId;
    }

    public Instructor(int insId, String insFirstName, String insMidName, String insLastName) {
        this.insId = insId;
        this.insFirstName = insFirstName;
        this.insMidName = insMidName;
        this.insLastName = insLastName;
    }

    public Instructor(int insId, String insFirstName) {
        this.insId = insId;
        this.insLastName = insFirstName;
    }
    

    public int getInsId() {
        return insId;
    }

    public void setInsId(int insId) {
        this.insId = insId;
    }

    public String getInsFirstName() {
        return insFirstName;
    }

    public void setInsFirstName(String insFirstName) {
        this.insFirstName = insFirstName;
    }

    public String getInsMidName() {
        return insMidName;
    }

    public void setInsMidName(String insMidName) {
        this.insMidName = insMidName;
    }

    public String getInsLastName() {
        return insLastName;
    }

    public void setInsLastName(String insLastName) {
        this.insLastName = insLastName;
    }
   
    
}
