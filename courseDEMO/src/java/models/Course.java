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
public class Course {
    private int courseId;
    private String courseCode;
    private String CourseDescription;
    private int subjectId;
    private Instructor instructor;

    public Course(int courseId, String courseCode, String CourseDescription, int subjectId, Instructor instructor) {
        this.courseId = courseId;
        this.courseCode = courseCode;
        this.CourseDescription = CourseDescription;
        this.subjectId = subjectId;
        this.instructor = instructor;
    }

    public Course(int courseId, String courseCode, String CourseDescription, int subjectId) {
        this.courseId = courseId;
        this.courseCode = courseCode;
        this.CourseDescription = CourseDescription;
        this.subjectId = subjectId;
    }

    public Course(int courseId, String courseCode) {
        this.courseId = courseId;
        this.courseCode = courseCode;
    }

    public Course(int courseId) {
        this.courseId = courseId;
    }   

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getCourseDescription() {
        return CourseDescription;
    }

    public void setCourseDescription(String CourseDescription) {
        this.CourseDescription = CourseDescription;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }
    
    public void addInstructor(int id, String LastName){
        Instructor d = new Instructor(id, LastName);
        this.instructor = d;
    }
    
    
}
