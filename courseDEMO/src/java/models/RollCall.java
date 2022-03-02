/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author black
 */
public class RollCall {
    private int id;
    private Student student;
    private boolean isAbsent;
    private String comment;
    private int teachId;

    public RollCall() {
    }

    public RollCall(int id, Student student, boolean isAbsent, String comment) {
        this.id = id;
        this.student = student;
        this.isAbsent = isAbsent;
        this.comment = comment;
    }

    public RollCall(int id, boolean isAbsent, String comment) {
        this.id = id;
        this.isAbsent = isAbsent;
        this.comment = comment;
    }

    public RollCall(Student student, boolean isAbsent, String comment, int teachId) {
        this.student = student;
        this.isAbsent = isAbsent;
        this.comment = comment;
        this.teachId = teachId;
    }
    

    public RollCall(int id, Student student, boolean isAbsent, String comment, int teachId) {
        this.id = id;
        this.student = student;
        this.isAbsent = isAbsent;
        this.comment = comment;
        this.teachId = teachId;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public boolean isIsAbsent() {
        return isAbsent;
    }

    public void setIsAbsent(boolean isAbsent) {
        this.isAbsent = isAbsent;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getTeachId() {
        return teachId;
    }

    public void setTeachId(int teachId) {
        this.teachId = teachId;
    }    
    
    public void addStudent(int id, String roll, String lastName, String midName, String firstName ){
        Student s = new Student(id, roll, firstName, midName, lastName);
        this.student = s;       
    }
    
}
