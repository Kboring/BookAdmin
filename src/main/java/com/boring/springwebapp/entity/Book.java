package com.boring.springwebapp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

public class Book {
    private int book_id;
    private String book_name;
    private String book_author;
    private String book_pub;
    private String book_sort;

    public Book() {
    }

    public Book(int book_id, String book_name, String book_author, String book_pub, String book_sort) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.book_author = book_author;
        this.book_pub = book_pub;
        this.book_sort = book_sort;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    @Override
    public String toString() {
        return "Book{" +
                "book_id=" + book_id +
                ", book_name='" + book_name + '\'' +
                ", book_author='" + book_author + '\'' +
                ", book_pub='" + book_pub + '\'' +
                ", book_sort='" + book_sort + '\'' +
                '}';
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getBook_author() {
        return book_author;
    }

    public void setBook_author(String book_author) {
        this.book_author = book_author;
    }

    public String getBook_pub() {
        return book_pub;
    }

    public void setBook_pub(String book_pub) {
        this.book_pub = book_pub;
    }

    public String getBook_sort() {
        return book_sort;
    }

    public void setBook_sort(String book_sort) {
        this.book_sort = book_sort;
    }
}
