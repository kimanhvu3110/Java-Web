/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.time.LocalDate;

/**
 *
 * @author black
 */
public class Employee {
    private int id;
    private String name;
    private LocalDate dob;
    private String sex;
    private String position;
    private Department department;
    private int deptID;

    public Employee(int id, String name, LocalDate dob, String sex, String position) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.sex = sex;
        this.position = position;
    }

    public Employee(String name, LocalDate dob, String sex, String position) {
        this.name = name;
        this.dob = dob;
        this.sex = sex;
        this.position = position;       
    }

    public Employee(int id, String name, LocalDate dob, String sex, String position, int deptID) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.sex = sex;
        this.position = position;
        this.deptID = deptID;
    }
       
   
    public Employee() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public int getDeptID() {
        return deptID;
    }

    public void setDeptID(int deptID) {
        this.deptID = deptID;
    }
    
    
    public void addDepartment(int id, String deptName){
        Department d = new Department(id, deptName);
        this.department = d;
    }

    @Override
    public String toString() {
        return "Employee{" + "id=" + id + ", name=" + name + ", dob=" + dob +
                ", sex=" + sex + ", position=" + position + ", department=" + department.toString() + ", deptID=" + deptID + '}';
    }
   
}
