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
public class MoonKing {
    private int id;
    private int uid;
    private LocalDate startDate;
    private LocalDate endDate;
    private int year;

    public MoonKing() {
    }

    public MoonKing(int id, int uid, LocalDate startDate, LocalDate endDate, int year) {
        this.id = id;
        this.uid = uid;
        this.startDate = startDate;
        this.endDate = endDate;
        this.year = year;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public MoonKing(int id, LocalDate startDate, LocalDate endDate, int year) {
        this.id = id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.year = year;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
    
}
