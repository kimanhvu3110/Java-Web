/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.MoonKing;


/**
 *
 * @author black
 */
public class MoonDAO extends DBContext {
     public ArrayList<MoonKing> getDateofUid(int uid, int year)
    {
        ArrayList<MoonKing> list = new ArrayList<>();
        try{
            String sql = "Select * from MoonKing where userid = ? and [year] = ? order by startDate";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            stm.setInt(2, year);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
               MoonKing d = new MoonKing(
                        rs.getInt("MoonID"),
                        rs.getDate("startDate").toLocalDate(),
                        rs.getDate("endDate").toLocalDate(),
                        rs.getInt("year")                       
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
     
     public ArrayList<Integer> getYearofUid(int uid)
    {
        ArrayList<Integer> list = new ArrayList<>();
        try{
            String sql = "Select distinct [year] from MoonKing where userid = ? order by [year]";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
               list.add(rs.getInt(1));
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     
      public void insertNewDay(int uid, LocalDate startDate, LocalDate end, int year){
        try{
            String sql = "insert into MoonKing([UserId],[StartDate],[EndDate],[Year]) values (?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid );
            stm.setDate(2, Date.valueOf(startDate));
            stm.setDate(3, Date.valueOf(end));
            stm.setInt(4, year );
            stm.executeUpdate();           
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
