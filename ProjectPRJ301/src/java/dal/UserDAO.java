/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Account;

/**
 *
 * @author black
 */
public class UserDAO extends DBContext{
    public int checkUser(String name){      
        try{
            String sql = "Select count(*) from users where LOWER(UserName) = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
               return rs.getInt(1);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public int checkMail(String name){      
        try{
            String sql = "Select count(*) from users where LOWER(email) = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
               return rs.getInt(1);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public HashMap<Integer, Account> getAllAccount()
    {       
        HashMap<Integer, Account> acc = new HashMap<>();
        try{
            String sql = "Select * from Users";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();     
            while (rs.next())
            {
              Account c = new Account(
                      rs.getInt("userid"),
                      rs.getString("username"),
                      rs.getString("password"),
                      rs.getString("email")
              );
              acc.put(c.getId(), c);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }
    
    public void insertNewUser(String user, String pass, String mail){
        try{
            String sql = "insert into users(username, password, email) values (?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            stm.setString(3, mail);
            stm.executeUpdate();           
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
