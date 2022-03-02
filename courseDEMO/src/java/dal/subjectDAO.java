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
import models.Subject;

/**
 *
 * @author black
 */
public class subjectDAO extends DBContext{
     public ArrayList<Subject> getAllSubjects(int index)
    {
        ArrayList<Subject> list = new ArrayList<>();
        try{
            String sql = "Select SubjectCode, SubjectName, SubjectId from SUBJECTS order by subjectID offset (?-1)*20 rows fetch next 20 rows only";                                    
            PreparedStatement stm = connection.prepareStatement(sql); 
            stm.setInt(1, index);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {              
                Subject p = new Subject(
                        rs.getInt("SubjectId"),
                        rs.getString("SubjectCode"),
                        rs.getString("SubjectName")
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
     
     public int getTotalSubjects(){
        try{
            String sql = "Select count(*) from subjects";                  
            PreparedStatement stm = connection.prepareStatement(sql);
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
     
     public ArrayList<Subject> getSubjectsFind(String search)
    {
        ArrayList<Subject> list = new ArrayList<>();
        try{
            String sql = "Select SubjectCode, SubjectName, SubjectId from SUBJECTS where "
                    + "subjectCode like '%" + search +"%' or subjectName like '%" + search +"%' ";                                    
            PreparedStatement stm = connection.prepareStatement(sql); 
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {              
                Subject p = new Subject(
                        rs.getInt("SubjectId"),
                        rs.getString("SubjectCode"),
                        rs.getString("SubjectName"));             
                list.add(p);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     
}
