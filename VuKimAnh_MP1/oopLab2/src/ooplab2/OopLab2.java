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
public class OopLab2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        final int MAX_HEADCOUNT = 20;
        Person[] person_array = new Person[MAX_HEADCOUNT];
// A student named Peter
        person_array[0] = new Student("Peter");
// An instructor named Peter
        person_array[1] = new Instructor("Peter");
// An instructor named Sandy and her salary
        person_array[2] = new Instructor("Sandy", 25000);
// A janitor named Bob
        person_array[3] = new Employee("Janitor Bob");

        person_array[4] = new Student("Tom", "Peter", person_array);
// A student named Maggie and her instructor is Susan
// right after executing the following statement
// person_array[5].TeacherID = 0
// person_array[5].TeacherName = “Susan”
        person_array[5] = new Student("Maggie", "Susan", person_array);
// An instructor named Susan and her salary
        person_array[6] = new Instructor("Susan", 40000);

        Instructor.fillStudents(person_array);
        System.out.println("ID and name of all personnel in the array");
        for (int i = 0; i < Person.getMaxID(); i++) {
            System.out.println(person_array[i].getID() + ":" + person_array[i].toString());
        }

    }

}
