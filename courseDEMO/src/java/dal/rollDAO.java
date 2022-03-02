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
import models.RollCall;
import models.Student;
import models.Teaching;


/**
 *
 * @author black
 */
public class rollDAO extends DBContext{
    public int CountScheID(int scheduleID){
        try{
            String sql = "Select count(*)"
                    + " from Roll_call_books where teachingScheduleId = ? ";                                    
            PreparedStatement stm = connection.prepareStatement(sql); 
            stm.setInt(1, scheduleID);
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
        return 0;
    }
    
    public ArrayList<RollCall> getAllRoll(int index)
    {
        ArrayList<RollCall> list = new ArrayList<>();
        try{
            String sql = "Select *"
                    + " from students s, roll_call_books i where s.studentid = i.studentId and teachingscheduleId = ? ";                                    
            PreparedStatement stm = connection.prepareStatement(sql); 
            stm.setInt(1, index);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {              
                RollCall p = new RollCall(
                        rs.getInt("RollCallBookId"),
                        rs.getBoolean("IsAbsent"),
                        rs.getString("Comment")
                        );
                p.addStudent(rs.getInt("StudentId"), 
                rs.getString("Roll#"),rs.getString("FirstName"),rs.getString("MidName"),rs.getString("LastName"));
                list.add(p);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public Teaching getTeachByid(int id){
        Teaching a = new Teaching();
        try{
            String sql = "Select *"
                    + " from Course_Schedules where teachingscheduleId = ? ";                                    
            PreparedStatement stm = connection.prepareStatement(sql); 
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {              
               Teaching p = new Teaching(
                        rs.getDate("TeachingDate").toLocalDate(),
                        rs.getInt("slot"),
                        rs.getInt("RoomID")
                        );
               p.addCourse(rs.getInt("CourseId"));
              return p;
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ArrayList<Integer> getAllStuID(int index)
    {
        ArrayList<Integer> list = new ArrayList<>();
        try{
            String sql = "Select StudentId"
                    + " from student_course where courseId = ? ";                                    
            PreparedStatement stm = connection.prepareStatement(sql); 
            stm.setInt(1, index);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {              
                Integer p = rs.getInt("StudentId");
                list.add(p);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Student> getAllStudentinSlot(ArrayList<Integer> stuID){      
        String stuIDs = stuID.toString();
        stuIDs = '(' + stuIDs.substring(1);
        stuIDs = stuIDs.substring(0,stuIDs.length()-1) + ')';
        
        ArrayList<Student> list = new ArrayList<>();
        try{
            String sql = "Select * from Students "
                    +" where studentId in " + stuIDs;                   
            PreparedStatement stm = connection.prepareStatement(sql);
            //stm.setString(1, stuIDs);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                
                Student p = new Student(
                        rs.getInt("STudentId"),
                        rs.getString("Roll#"),
                        rs.getString("FirstName"),
                        rs.getString("MidName"),
                        rs.getString("LastName")
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
    
    public void takeAttend(ArrayList<Integer> stuID){
        
    }
    
     public void editAttendnotAbs(ArrayList<Integer> stuID, int teachID){
        String stuIDs = stuID.toString();
        stuIDs = '(' + stuIDs.substring(1);
        stuIDs = stuIDs.substring(0,stuIDs.length()-1) + ')';
        
        ArrayList<Student> list = new ArrayList<>();
        try{
            String sql = "update roll_call_books\n" +
                      "set IsAbsent = 0 where RollCallBookId in " + stuIDs;                 
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
         
    }
     
     public void editAttendAbs(ArrayList<Integer> stuID, int teachID){
        String stuIDs = stuID.toString();
        stuIDs = '(' + stuIDs.substring(1);
        stuIDs = stuIDs.substring(0,stuIDs.length()-1) + ')';
        
        ArrayList<Student> list = new ArrayList<>();
        try{
            String sql = "update roll_call_books\n" +
                      "set IsAbsent = 1 where RollCallBookId in " + stuIDs;                 
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
         
    }
     
     public void getTComment(String cmt, int stuID){
        try{
            String sql = "update roll_call_books\n" +
                      "set comment = ? where RollCallBookId = ? ";                 
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, cmt);
            stm.setInt(2, stuID);
            stm.executeUpdate();
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }      
     }
     
     public int getLastId(){
         try{
            String sql = "Select top(1) rollCallbookId from Roll_Call_Books"
                    + " order by rollcallbookid desc" ;                                   
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                int RollID = rs.getInt(1);
                return RollID;
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }  
         return -1;   
     }
     
     
     public void insertRollCall(RollCall r, int id){
         try{
            String sql = "SET IDENTITY_INSERT Roll_Call_Books  ON  "
                    + " INSERT [ROLL_CALL_BOOKS] ([RollCallBookId], [TeachingScheduleId], [StudentId], [IsAbsent], [Comment])"
                    + " VALUES (?, ?, ?, ?, ?)" ;                                   
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setInt(2, r.getTeachId());
            stm.setInt(3, r.getStudent().getId());
            stm.setBoolean(4, r.isIsAbsent());
            stm.setString(5, r.getComment());
            stm.executeUpdate();
          
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }  
       
     }
    
    
}
