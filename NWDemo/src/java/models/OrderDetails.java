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
public class OrderDetails {
    private int orderID;
    private int productID;
    private int quantity;
    private double unitPrice;

    public OrderDetails(int orderID, int productID, int quantity, double unitPrice) {
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public OrderDetails(int productID, int quantity) {
        this.productID = productID;
        this.quantity = quantity;
    }

    public OrderDetails(int productID, int quantity, double unitPrice) {
        this.productID = productID;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }
       
  
    public OrderDetails() {
    }
    

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }
    
    
}
