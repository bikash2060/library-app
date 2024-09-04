package model;

import java.sql.Date;

public class Book {

    private int bookID;
    private String bookTitle;
    private String description;
    private String authorName;
    private Date publishDate;
    private double price;
    private String language;
    private int quantity;
    private String image;
    private boolean showOnHomePage;

    public Book() {}

    public Book(String bookTitle, String description, String authorName, Date publishDate, double price, String language, int quantity, String image, boolean showOnHomePage) {
        this.bookTitle = bookTitle;
        this.description = description;
        this.authorName = authorName;
        this.publishDate = publishDate;
        this.price = price;
        this.language = language;
        this.quantity = quantity;
        this.image = image;
        this.showOnHomePage = showOnHomePage;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isShowOnHomePage() {
        return showOnHomePage;
    }

    public void setShowOnHomePage(boolean showOnHomePage) {
        this.showOnHomePage = showOnHomePage;
    }
}
