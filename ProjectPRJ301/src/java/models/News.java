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
public class News {
    private int id;
    private Category category;
    private String title;
    private String image;
    private String imageC;

    public News(String title, String image, String imageC, String description, String content, LocalDate DateCreated) {
        this.title = title;
        this.image = image;
        this.imageC = imageC;
        this.description = description;
        this.content = content;
        this.DateCreated = DateCreated;
    }

    public String getImageC() {
        return imageC;
    }

    public void setImageC(String imageC) {
        this.imageC = imageC;
    }
    private String description;
    private String content;
    private LocalDate DateCreated;

    public News(int id, Category category, String title, String image, String description, String content, LocalDate DateCreated) {
        this.id = id;
        this.category = category;
        this.title = title;
        this.image = image;
        this.description = description;
        this.content = content;
        this.DateCreated = DateCreated;
    }

    public News(int id,String title, String image, String description, String content) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.description = description;
        this.content = content;
    }

    public News(int id, Category category, String title, String image, String imageC, String description, String content, LocalDate DateCreated) {
        this.id = id;
        this.category = category;
        this.title = title;
        this.image = image;
        this.imageC = imageC;
        this.description = description;
        this.content = content;
        this.DateCreated = DateCreated;
    }
    

    public News() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDate getDateCreated() {
        return DateCreated;
    }

    public void setDateCreated(LocalDate DateCreated) {
        this.DateCreated = DateCreated;
    }
    
     public void getCategoryObject(int id, String Name){
        Category d = new Category(id, Name);
        this.category = d;
    }
    
}
