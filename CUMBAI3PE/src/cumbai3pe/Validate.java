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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Validate {
    
    public boolean isContainDigitAndLetter(String s) {
        boolean hasDigit = false, hasLetter = false;
        for (int i = 0; i < s.length(); i++) {
            if (Character.isDigit(s.charAt(i))) {//nếu tồn tại kí tự số thì dánh dấu là có số
                hasDigit = true;
            }
            if (Character.isLetter(s.charAt(i))) {//nếu tồn tại kí tự chữ thì dánh dấu là có chữ
                hasLetter = true;
            }
        }
        if (hasDigit && hasLetter) { //nếu có cả chữ và số
            return true;
        } else {
            return false;
        }
    }

    //count and return number of book which has code contain digit and letter
    public int f1(List<Book> a) {
        int count = 0;
        for (Book book : a) {
            if (isContainDigitAndLetter(book.getCode())) {
                count++;
            }
        }
        return count;
        
    }

    //count and return number of book which has code start with "c"
    //the comparation must ignore case
    public int f2(List<Book> a) {
        int count = 0;
        for (Book book : a) {
            if (book.getCode().toLowerCase().startsWith("c")) {
                count++;
            }
        }
        return count;
    }

    //sort books assending by price if price greater or equals 20
    //if book have price smaller than 20 then keep the position 
    public void f3(List<Book> a) {
        for (Book book : a) {
            System.out.println(book);
        }
        System.out.println("----------------------------------\n");
        for (int i = 0; i < a.size() - 1; i++) {
            for (int j = i + 1; j < a.size(); j++) {
                double p1 = a.get(i).getPrice();
                double p2 = a.get(j).getPrice();
                if (p1 >= 20 && p2 >= 20 && p1 > p2) {
                    Collections.swap(a, i, j);
                }
            }
            
        }
    }
    
    public String getFirstName(String name) {
        String[] words = name.split("[ ]+");
        return words[0];
    }

    //sort list assending by first name of book.
    public String f4(List<Book> a) {
        Collections.sort(a, new Comparator<Book>() {
            @Override
            public int compare(Book o1, Book o2) {
                return getFirstName(o1.getName()).compareTo(getFirstName(o2.getName()));
            }
        });
        return "";
    }

    //change all code of all book
    //input code: MLN1051309hn
    //output code:mln1051309HN
    public String inverseLetter(String s) {
        String result = "";
        for (int i = 0; i < s.length(); i++) {
            if (Character.isLetter(s.charAt(i))) {
                if (Character.isUpperCase(s.charAt(i))) {
                    result += (s.charAt(i) + "").toLowerCase();
                } else {
                    result += (s.charAt(i) + "").toUpperCase();
                }
            } else {
                result += s.charAt(i);
            }
        }
        return result;
    }
    
    public void f5(List<Book> a) {
        for (Book book : a) {
            String inverse = inverseLetter(book.getCode());
            book.setCode(inverse);
        }
    }

    //remove last book which has price = min price
    public void f6(List<Book> a) {
        
    }

    //sort assending by price, if price equal then assending by name
    public void f7(List<Book> a) {
        Collections.sort(a, new Comparator<Book>() {
            @Override
            public int compare(Book o1, Book o2) {
                if (o1.getPrice() > o2.getPrice()) {
                    return 1;
                } else if (o1.getPrice() < o2.getPrice()) {
                    return -1;
                } else {// giá o1 bằng o2
                    //sắp xếp tăng dần theo tên
                    return o1.getName().compareTo(o2.getName());
                }
            }
        });
    }

    //return list book có brand là "truyen tranh"
    public List<Book> f8(List<Book> a) {
        List<Book> listComic = new ArrayList<>(); //tao list rong
        //kiem tra, neu thoa man thi add vao list
        for (Book book : a) {
            if (book.getType().equalsIgnoreCase("truyen tranh")) {
                listComic.add(book);
            }
        }
        return listComic;
    }

    //sort ascending list by code from index
    public void f9(List<Book> a, int index) {
        Collections.sort(a, new Comparator<Book>() {
            @Override
            public int compare(Book o1, Book o2) {
                if (a.indexOf(o1) < index) {
                    return 0;
                }
                if (a.indexOf(o2) < index) {
                    return 0;
                }
                return o1.getCode().compareToIgnoreCase(o2.getCode());
            }
        });
    }

    //sort ascending book in list by price which has brand is "truyen dai"
    // các vị trí khác không thay đổi
    public void f10(List<Book> a) {
//        Collections.sort(a, new Comparator<Book>() {
//            @Override
//            public int compare(Book o1, Book o2) {
//                if (o1.getType().equalsIgnoreCase("truyen dai")
//                        && o2.getType().equalsIgnoreCase("truyen dai")) {
//                    if(o1.getPrice()>o2.getPrice()){
//                        return 1;
//                    }else if(o1.getPrice()<o2.getPrice()){
//                        return -1;
//                    }else{
//                        return 0;
//                    }
//                }else{
//                    return 0;
//                }
//            }
//        });

        for (int i = 0; i < a.size() - 1; i++) {
            for (int j = i + 1; j < a.size(); j++) {
                Book o1 = a.get(i);
                Book o2 = a.get(j);
                if (o1.getType().equalsIgnoreCase("truyen dai")
                        && o2.getType().equalsIgnoreCase("truyen dai")) {
                    if (o1.getPrice() > o2.getPrice()) {
                        Collections.swap(a, i, j);
                    }
                }
            }
        }
    }
    //sap xep list theo price từ vị trí i đề bài yêu cầu 
    public void f11(List<Book> a, int index){
        List<Book> b=new ArrayList<>();
        for(int i=index;i<a.size();i++){
            b.add(a.get(i));
            a.remove(i);
            i--;
        }
        Collections.sort(b, new Comparator<Book>(){
            @Override
            public int compare(Book t, Book t1) {
                if(t.getPrice() > t1.getPrice()){
                    return 1;
                } else if(t.getPrice() < t1.getPrice())
                {return -1;
                }
                else return 0;
                }
            });
            for(Book o: b){
                a.add(o);
            }
            for (Book book : a) {
                    System.out.println(book);
                }
        }
    }
    
