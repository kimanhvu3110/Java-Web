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
public class Employee extends Person {

    private double Salary = 0.0;

    public Employee() {
    }

    public Employee(String Name, double Salary) {
        super(Name);
        this.Salary = Salary;
    }

    public Employee(String Name) {
        super(Name);
    }

    public double getSalary() {
        return Salary;
    }

    public int getEID() {
        return this.getID();
    }

    public void setSalary(double Salary) {
        this.Salary = Salary;
    }

    @Override
    public String toString() {
        return this.getName() + " is an employee earning a salary of "
                + this.Salary;
    }

}
