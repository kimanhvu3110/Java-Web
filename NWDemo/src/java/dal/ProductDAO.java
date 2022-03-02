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
import models.Product;

/**
 *
 * @author black
 */
public class ProductDAO extends DBContext{
     public ArrayList<Product> getAllProducts(int catID)
    {
        ArrayList<Product> list = new ArrayList<>();
        try{
            String sql = "Select P.*, C.* from Products P, Categories C where P.categoryId = C.categoryId "
                    +" and C.categoryID = ? ";                   
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, catID);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Category cat = new Category(
                        rs.getInt("CategoryId"), 
                        rs.getString("CategoryName"),
                        rs.getString("Description"));
                Product p = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        cat,
                        rs.getDouble("UnitPrice"),
                        rs.getInt("UnitsInStock")
                );
                list.add(p);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     
     public ArrayList<Product> getAllProducts()
    {
        ArrayList<Product> list = new ArrayList<>();
        try{
            String sql = "Select P.*, C.* from Products P, Categories C where P.categoryId = C.categoryId";                   
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Category cat = new Category(
                        rs.getInt("CategoryId"), 
                        rs.getString("CategoryName"),
                        rs.getString("Description"));
                Product p = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        cat,
                        rs.getDouble("UnitPrice"),
                        rs.getInt("UnitsInStock")
                );
                list.add(p);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     
     public ArrayList<Product> getProducts(ArrayList<Integer> productID)
    {
        String productIDs = productID.toString();
        productIDs = '(' + productIDs.substring(1);
        productIDs = productIDs.substring(0,productIDs.length()-1) + ')';
        
        ArrayList<Product> list = new ArrayList<>();
        try{
            String sql = "Select P.*, C.CategoryName, C.Description from Products P, Categories C where P.categoryId = C.categoryId "
                    +" and P.productID in " + productIDs;                   
            PreparedStatement stm = connection.prepareStatement(sql);
            //stm.setString(1, productIDs);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Category cat = new Category(
                        rs.getInt("CategoryId"), 
                        rs.getString("CategoryName"),
                        rs.getString("Description"));
                Product p = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        cat,
                        rs.getDouble("UnitPrice"),
                        rs.getInt("UnitsInStock")
                );
                list.add(p);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     
     public Product getProductsById(int productID)
    {
        try{
            String sql = "Select P.*, C.CategoryName, C.Description from Products P, Categories C where P.categoryId = C.categoryId "
                    +" and P.productID = ? " ;                   
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Category cat = new Category(
                        rs.getInt("CategoryId"), 
                        rs.getString("CategoryName"),
                        rs.getString("Description"));
                Product p = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        cat,
                        rs.getDouble("UnitPrice"),
                        rs.getInt("UnitsInStock")
                );
                return p;
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }     
}
