/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Order;

/**
 *
 * @author black
 */
public class OrderDAO extends DBContext{
    public int InsertOrderInfo(Order o){
        try{
            String sql = "insert into Orders(OrderDate, RequiredDate, Shipvia, ShipName, ShipAddress)"
                    + "values (getdate(),?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            System.out.println(stm);            
            stm.setDate(1, Date.valueOf(o.getRequiredDate()));
            stm.setInt(2, o.getShipper().getShipID());
            stm.setString(3, o.getShipName());
            stm.setString(4, o.getShipAddress());
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            if(rs.next()){
                int OrderID = Integer.parseInt(rs.getString(1));
                return OrderID;
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    

}
