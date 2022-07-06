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
import models.News;

/**
 *
 * @author black
 */
public class newsDAO extends DBContext{
     public ArrayList<News> getHomeNews()
    {
        ArrayList<News> list = new ArrayList<>();
        try{
            String sql = "Select Top(5) * from News order by DateCreated";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
               News d = new News(
                        rs.getInt("NewsID"),
                        rs.getString("Title"),
                        rs.getString("imageF"),
                        rs.getString("NewsDescription"),
                        rs.getString("NewsContent")                       
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
     
     public News getNewsById(int id){
         try{
            String sql = "Select news.*,categoryName from News join categories on news.categoryid = categories.categoryid where newsid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
               News d = new News(                                               
                        rs.getString("Title"),
                        rs.getString("imageF"),
                        rs.getString("imageC"),
                        rs.getString("NewsDescription"),
                        rs.getString("NewsContent"),
                        rs.getDate("DateCreated").toLocalDate()
                );
               d.getCategoryObject(rs.getInt("categoryid"), rs.getString("categoryname"));
               return d;
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
         return null;
     }
     
     public ArrayList<News> getNewsByCategory(int id)
    {
        ArrayList<News> list = new ArrayList<>();
        try{
            String sql = "Select * from News where CategoryId = ? order by datecreated";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
               News d = new News(
                        rs.getInt("NewsID"),
                        rs.getString("Title"),
                        rs.getString("imageF"),
                        rs.getString("NewsDescription"),
                        rs.getString("NewsContent")                       
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
     
     public ArrayList<News> getAllNewsByIdC(int index, int id)
    {
        ArrayList<News> list = new ArrayList<>();
        try{
            String sql = "Select * from News where categoryid = ? order by DateCreated offset (?-1)*2 rows fetch next 2 rows only";                                    
            PreparedStatement stm = connection.prepareStatement(sql); 
            stm.setInt(1, id);
            stm.setInt(2, index);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {              
                News d = new News(
                        rs.getInt("NewsID"),
                        rs.getString("Title"),
                        rs.getString("imageF"),
                        rs.getString("NewsDescription"),
                        rs.getString("NewsContent")                       
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
     
     public void saveNews(int uid, int nid){
          try{
            String sql = "insert into saveNews (userid, newsid) values (?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            stm.setInt(2, nid);
             stm.executeUpdate();
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
     public void NotsaveNews(int uid, int nid){
          try{
            String sql = "delete from saveNews where userid = ? and newsid =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            stm.setInt(2, nid);
             stm.executeUpdate();
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
     public int checkSaved(int uid, int id)
    {
        try{
            String sql = "Select count(*) from saveNews where userid = ? and newsid = ?";                                    
            PreparedStatement stm = connection.prepareStatement(sql); 
            stm.setInt(1, uid);
            stm.setInt(2, id);
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
     public ArrayList<Integer> getSavedNewsId(int uid)
    {
        
        ArrayList<Integer> list = new ArrayList<>();
        try{
            String sql = "Select * from saveNews where userid = ?";                                  
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                
                list.add(rs.getInt("newsid"));
               
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     
     public ArrayList<News> getSavedNews(ArrayList<Integer> newsID)
    {
        String NewsIDs = newsID.toString();
        NewsIDs = '(' + NewsIDs.substring(1);
        NewsIDs = NewsIDs.substring(0,NewsIDs.length()-1) + ')';
        
        ArrayList<News> list = new ArrayList<>();
        try{
            String sql = "Select * from News where newsid in "+ NewsIDs;                                  
            PreparedStatement stm = connection.prepareStatement(sql);
            //stm.setString(1, productIDs);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                 News d = new News(
                        rs.getInt("NewsID"),
                        rs.getString("Title"),
                        rs.getString("imageF"),
                        rs.getString("NewsDescription"),
                        rs.getString("NewsContent")                       
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
     
     
}
