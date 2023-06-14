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
public class Instructor extends Employee {

    public int studentID[] = new int[10];
    public int count = 0;

    public Instructor(String Name, double Salary) {
        super();
        this.setName(Name);
        this.setSalary(Salary);
    }

    public Instructor(String Name) {
        super();
        this.setName(Name);
    }

    public static void fillStudents(Person[] person_array) {
        for (int i = 0; i < person_array.length; i++) {
            if (person_array[i] instanceof Instructor) {
                Instructor ins = (Instructor) person_array[i];
                ins.count = 0;
                for (int j = 0; j < person_array.length; j++) {
                    if (person_array[j] instanceof Student) {
                        Student temp = (Student) person_array[j];
                        if (temp.getTeacherName().equals(ins.getName())) {
                            ins.studentID[ins.count] = temp.getID();
                            ins.count++;
                            temp.setTeacherID(ins.getID());
                        }
                    }
                }
            }
        }
    }

    @Override
    public String toString() {
        if (count == 0) {
            return this.getName() + " is an Instructor earning a salary of "
                    + this.getSalary() + " with 0 student in his/her class";
        }
        String result = this.getName() + " is an Instructor earning a salary of "
                + this.getSalary() + " with " + count + " student in his/her class";
        for (int i = 0; i < studentID.length; i++) {
            if (studentID[i] != 0) {
                result += "\n" + "Student[" + i + "]:" + studentID[i];
            }
        }
        return result;
    }
}
