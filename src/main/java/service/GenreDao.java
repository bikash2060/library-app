package service;

import model.Genre;
import utils.DatabaseConnection;
import utils.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GenreDao {

    Connection con;

    public GenreDao() {
        try{
            this.con = DatabaseConnection.getDatabaseConnection();
        }
        catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
    }

    public List<Genre> getAllGenre(){
        List<Genre> genres = new ArrayList<>();
        try{
            PreparedStatement ps = con.prepareStatement(StringUtils.GET_ALL_GENRE);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Genre newGenre = new Genre();
                newGenre.setGenreID(rs.getInt("GenreID"));
                newGenre.setGenreName(rs.getString("GenreName"));
                genres.add(newGenre);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genres;
    }
}
