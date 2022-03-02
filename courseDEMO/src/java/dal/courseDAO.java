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
import models.Course;
import models.Teaching;

/**
 *
 * @author black
 */
public class courseDAO extends DBContext{
    public ArrayList<Course> getAllCourse(int index)
    {
        ArrayList<Course> list = new ArrayList<>();
        try{
            String sql = "Select courseId, courseCode, CourseDescription, SubjectId, c.InstructorId, InstructorFirstName"
                    + " from Courses c, Instructors i where c.InstructorId = i.InstructorId and subjectId = ? ";                                    
            PreparedStatement stm = connection.prepareStatement(sql); 
            stm.setInt(1, index);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {              
                Course p = new Course(
                        rs.getInt("courseId"),
                        rs.getString("courseCode"),
                        rs.getString("courseDescription"),
                        rs.getInt("SubjectId")
                        );
                p.addInstructor(rs.getInt("InstructorId"), rs.getString("InstructorFirstName"));
                list.add(p);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Teaching> getAllSlot(int courseID)
    {
        ArrayList<Teaching> list = new ArrayList<>();
        try{
            String sql = "Select TeachingScheduleId, courseCode, c.courseId, TeachingDate, slot, roomId "
                    + " from course_schedules c, courses e where c.courseId = e.courseId and c.courseId = ? order by TeachingDate, slot ";                                    
            PreparedStatement stm = connection.prepareStatement(sql); 
            stm.setInt(1,courseID);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {              
                Teaching p = new Teaching(
                        rs.getInt("TeachingScheduleId"),
                        rs.getDate("TeachingDate").toLocalDate(),
                        rs.getInt("slot"),
                        rs.getInt("RoomId")
                        );
                p.addCourse(rs.getInt("courseId"), rs.getString("courseCode"));
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
