package service;

import model.Book;
import utils.DatabaseConnection;
import utils.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
    Connection con;

    public BookDao() {
        try{
            this.con = DatabaseConnection.getDatabaseConnection();
        }
        catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
    }

    public List<Book> getFeaturedBook(){
        List<Book> books = new ArrayList<>();
        try(PreparedStatement ps = con.prepareStatement(StringUtils.GET_FEATURED_BOOKS)){
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Book book = new Book();
                book.setBookID(rs.getInt("BookID"));
                book.setBookTitle(rs.getString("BookTitle"));
                book.setDescription(rs.getString("Description"));
                book.setAuthorName(rs.getString("AuthorName"));
                book.setPublishDate(rs.getDate("PublishedDate"));
                book.setPrice(rs.getDouble("Price"));
                book.setLanguage(rs.getString("Language"));
                book.setQuantity(rs.getInt("Quantity"));
                book.setImage(rs.getString("Image"));
                book.setGenreName(rs.getString("GenreName"));
                books.add(book);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return books;
    }

    public List<Book> getAllBook(){
        List<Book> allBooks = new ArrayList<>();
        try(PreparedStatement ps = con.prepareStatement(StringUtils.GET_ALL_BOOKS)){
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Book book = new Book();
                book.setBookID(rs.getInt("BookID"));
                book.setBookTitle(rs.getString("BookTitle"));
                book.setDescription(rs.getString("Description"));
                book.setAuthorName(rs.getString("AuthorName"));
                book.setPublishDate(rs.getDate("PublishedDate"));
                book.setPrice(rs.getDouble("Price"));
                book.setLanguage(rs.getString("Language"));
                book.setQuantity(rs.getInt("Quantity"));
                book.setImage(rs.getString("Image"));
                book.setGenreName(rs.getString("GenreName"));
                allBooks.add(book);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return allBooks;
    }

}
