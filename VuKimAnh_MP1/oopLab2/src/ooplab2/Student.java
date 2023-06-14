/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ooplab2;

/**
 *
 * @author black
 */
public class Student extends Person {

    private int TeacherID = 0;
    private String TeacherName = "";
    private Person[] persons;

    public Student(int TeacherID, String TeacherName, Person[] persons) {
        this.TeacherID = TeacherID;
        this.TeacherName = TeacherName;
        this.persons = persons;
    }

    public Student(String Name, String TeacherName, Person[] persons) {
        this.setName(Name);
        this.TeacherName = TeacherName;
        this.persons = persons;
        for (int i = 0; i < persons.length; i++) {
            if ((persons[i] instanceof Instructor)
                    && (persons[i].getName().equals(TeacherName))) {
                this.TeacherID = persons[i].getID();
                Instructor in = (Instructor) persons[i];
                in.studentID[in.count] = this.getID();
                in.count++;
                break;
            }
        }
    }

    public Student(String studentName) {
        this.setName(studentName);
    }

    public int getTeacherID() {
        return TeacherID;
    }

    public void setTeacherID(int TeacherID) {
        this.TeacherID = TeacherID;
    }

    public String getTeacherName() {
        return TeacherName;
    }

    public void setTeacherName(String TeacherName) {
        this.TeacherName = TeacherName;
    }

    @Override
    public String toString() {
        if (this.TeacherID == 0) {
            return this.getName() + " is a student";
        }
        return this.getName() + " is a student whose instructor is "
                + this.TeacherName + ", and his/her instructor's ID is "
                + this.TeacherID;
    }

}
