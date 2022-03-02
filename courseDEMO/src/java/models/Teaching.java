/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;


/**
 *
 * @author black
 */
public class Teaching {
    private Course course;
    private int teachingScheID;    
    private LocalDate teachDate;
    private int slot;
    private int RoomID;
    
    public Teaching(int teachingScheID, LocalDate teachDate, int slot, int RoomID) {
        this.teachingScheID = teachingScheID;
        this.teachDate = teachDate;
        this.slot = slot;
        this.RoomID = RoomID;
    }
    
    public Teaching() {
    }

    public Teaching(LocalDate teachDate, int slot, int RoomID) {
        this.teachDate = teachDate;
        this.slot = slot;
        this.RoomID = RoomID;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }  

    public String getTeachDate() {
        LocalDate date = LocalDate.parse(teachDate.toString());
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd-MM-yyyy");               
        return date.format(fmt);
    }

    public void setTeachDate(LocalDate teachDate) {
        this.teachDate = teachDate;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public int getRoomID() {
        return RoomID;
    }

    public void setRoomID(int RoomID) {
        this.RoomID = RoomID;
    }

    public int getTeachingScheID() {
        return teachingScheID;
    }

    public void setTeachingScheID(int teachingScheID) {
        this.teachingScheID = teachingScheID;
    }
    
    public void addCourse(int id, String courseCode){
        Course d = new Course(id, courseCode);
        this.course = d;
    }
    
    public void addCourse(int id){
        Course d = new Course(id);
        this.course = d;
    }
            
}
