/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Category;

/**
 *
 * @author black
 */
public class CategoryDAO extends DBContext{
     public ArrayList<Category> getAllCategoriesNo1()
    {
        ArrayList<Category> list = new ArrayList<>();
        try{
            String sql = "Select * from Categories where CategoryTypeID = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Category d = new Category(                       
                        rs.getInt("Categoryid"),
                        rs.getInt("CategoryTypeID"), 
                        rs.getString("CategoryName"),
                        rs.getString("CategoryDescription"),
                        rs.getDate("DateCreated").toLocalDate()
                );
                list.add(d);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     
     public ArrayList<Category> getAllCategoriesNo2()
    {
        ArrayList<Category> list = new ArrayList<>();
        try{
            String sql = "Select * from Categories where CategoryTypeID = 2";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Category d = new Category(                       
                        rs.getInt("Categoryid"),
                        rs.getInt("CategoryTypeID"), 
                        rs.getString("CategoryName"),
                        rs.getString("CategoryDescription"),
                        rs.getDate("DateCreated").toLocalDate()
                );
                list.add(d);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     
     public String getNameById(int id){
         try{
            String sql = "Select CategoryName from Categories where CategoryID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                return rs.getString(1);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
         return null;
     }
     
      public int getTotalCateById(int id){
        try{
            String sql = "Select count(*) from News where categoryid = ?";                  
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1,id);
            ResultSet rs = stm.executeQuery();           
            while (rs.next())
            {
                return rs.getInt(1);
            }
        } catch(Exception ex){
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }  
      
}
