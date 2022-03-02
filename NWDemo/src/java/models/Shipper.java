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
public class Shipper {
    private int shipID;
    private String companyName;

    public Shipper(int shipID, String companyName) {
        this.shipID = shipID;
        this.companyName = companyName;
    }

    public Shipper(int shipID) {
        this.shipID = shipID;
    }

    public int getShipID() {
        return shipID;
    }

    public void setShipID(int shipID) {
        this.shipID = shipID;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    
    
}
