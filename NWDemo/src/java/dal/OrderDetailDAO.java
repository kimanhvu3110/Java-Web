/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;


import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.OrderDetails;

/**
 *
 * @author black
 */
public class OrderDetailDAO extends DBContext{
    public void InsertOrderDetail(OrderDetails o){
        try{
            String sql = "insert into [Order Details](OrderID, ProductID, quantity, UnitPrice)"
                    + " values (?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            System.out.println(stm);            
            stm.setInt(1, o.getOrderID());
            stm.setInt(2, o.getProductID());
            stm.setInt(3, o.getQuantity());
            stm.setDouble(4, o.getUnitPrice());
            stm.executeUpdate();
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
