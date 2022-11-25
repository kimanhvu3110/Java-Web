/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cumbai3pe;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author Admin
 */
public class Main {
    public static void main(String[] args) {
        Validate v = new Validate();
        Book b0 = new Book("song da", "truyen dai", "abc105hA1309ab", 26);
        Book b1 = new Book("lao hac", "truyen dai", "abH105hA1309ab", 25);
        Book b2 = new Book("hat gao lang ta", "truyen dai", "MLN131", 19);
        Book b3 = new Book("truyen conan", "truyen tranh", "abcMLN", 19);
        Book b4 = new Book("than dong", "truyen dai", "efdacMLN131", 30);
        Book b5 = new Book("truyen doraemon", "truyen tranh", "mklacMLN", 25);
        Book b6 = new Book("truyen songoku", "truyen tranh", "hfdacMLN", 29);
        Book b7 = new Book("chiec la", "truyen dai", "uklacMLN131", 29);
        Book b8 = new Book("nguyen ngoc", "truyen dai", "aaacMLN", 16);
        Book b9 = new Book("chi la ban", "truyen dai", "bcaMLN131", 17);
        List<Book> list = new ArrayList<>();
        list.add(b0);
        list.add(b1);
        list.add(b2);
        list.add(b3);
        list.add(b4);
        list.add(b5);
        list.add(b6);
        list.add(b7);
        list.add(b8);
        list.add(b9);
        int choice = 0;
        System.out.print("input choice: ");
        Scanner sc = new Scanner(System.in);
        choice = Integer.parseInt(sc.nextLine());
        int index = 0;
        String txt = "";
        switch(choice){
            case 1:
                int number = v.f1(list);
                System.out.println(number);
                break;
            case 2:
                System.out.println(v.f2(list));
                break;
            case 3:
                v.f3(list);
                for (Book book : list) {
                    System.out.println(book);
                }
                break;
            case 4:
                v.f4(list);
                for (Book book : list) {
                    System.out.println(book);
                }
                break;
            case 5:
                v.f5(list);
                for (Book book : list) {
                    System.out.println(book);
                }
                break;
            case 6:
                 v.f6(list);
                for (Book book : list) {
                    System.out.println(book);
                }
                System.out.println(txt);
                break;
            case 7:
                v.f7(list);
                for (Book book : list) {
                    System.out.println(book);
                }
                break;
            case 8:
                List<Book> listB = v.f8(list);
                for (Book book : list) {
                    System.out.println(book);
                }
                break;
            case 9:
                System.out.print("input index: ");
                index = Integer.parseInt(sc.nextLine());
                v.f9(list,index);
                for (Book book : list) {
                    System.out.println(book);
                }
                break;
            case 10:
                v.f10(list);
                for (Book book : list) {
                    System.out.println(book);
                }
                break;
            case 11:
                System.out.print("Enter index: ");
                int choice1 = Integer.parseInt(sc.nextLine());
                v.f11(list, choice1);
                
                break;
        }
    }
}