package service;

import model.User;
import utils.DatabaseConnection;
import utils.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    Connection connection;

    public UserDao() throws SQLException, ClassNotFoundException {
        this.connection = DatabaseConnection.getDatabaseConnection();
    }

    /*
     * This method is used to check if a given email address exists in the database.
     * @return true if existed otherwise false.
     */
    public boolean checkEmail(String email){
        boolean result = false;
        try{
            PreparedStatement ps = connection.prepareStatement(StringUtils.GET_USER_BY_EMAIL);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                String dbEmail = rs.getString("EmailAddress");
                result = dbEmail.equals(email);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }

    /*
     * This method is used to check if a given phone number exists in the database.
     * @return true if existed otherwise false.
     */
    public boolean checkPhoneNumber(String phoneNumber){
        boolean result = false;
        try{
            PreparedStatement ps = connection.prepareStatement(StringUtils.GET_USER_BY_PHONE);
            ps.setString(1, phoneNumber);

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                String dbPhone = rs.getString("PhoneNumber");
                result = dbPhone.equals(phoneNumber);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }

    /*
     * This method is used to check if a given username exists in the database.
     * @return true if existed otherwise false.
    */
    public boolean checkUsername(String username){
        boolean result = false;
        try{
            PreparedStatement ps = connection.prepareStatement(StringUtils.GET_USER_BY_USERNAME);
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                String dbUsername = rs.getString("Username");
                result = dbUsername.equals(username);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }

    /*
     * This method registers a new user by inserting their information into the database.
     * It returns an integer code indicating the result of the registration process:
     *  0: Error occurred during login
     *  1: Registration successful
     * -1: Email address already exists in the database
     * -2: Phone number already exists in the database
     * -3: Username already exists in the database
     * -4: Error occurred during login
     */
    public int registerUser(User user){
        try{
            boolean existedEmail = checkEmail(user.getEmailAddress());
            boolean existedPhoneNumber = checkPhoneNumber(user.getPhoneNumber());
            boolean existedUsername = checkUsername(user.getUsername());

            if(existedEmail){
                return -1;
            }
            if(existedPhoneNumber){
                return -2;
            }
            if(existedUsername){
                return -3;
            }
            else{
                PreparedStatement ps = connection.prepareStatement(StringUtils.INSERT_USER);
                ps.setString(1, user.getFirstName());
                ps.setString(2, user.getLastName());
                ps.setString(3, user.getEmailAddress());
                ps.setString(4, user.getPassword());
                ps.setString(5, user.getPhoneNumber());
                ps.setString(6, user.getUsername());

                int result = ps.executeUpdate();

                if(result == 1){
                    return 1;
                }
                else{
                    return 0;
                }
            }
        }
        catch(SQLException e){
            e.printStackTrace();
            return -4;
        }
    }

    /*
     * This method retrieves user information from the database based on the provided username and validates the login credentials.
     * It returns an integer code indicating the result of the login process:
     *  0: Incorrect password
     *  1: Login successful
     * -1: Username not found in the database
     * -2: Error occurred during login
     */
    public int geUserInfo(User user){
        try{
            PreparedStatement ps = connection.prepareStatement(StringUtils.GET_USER_BY_USERNAME);
            ps.setString(1, user.getUsername());

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                String dbPassword = rs.getString("Password");
                if(dbPassword.equals(user.getPassword())){
                    return 1;
                }
                else{
                    return 0;
                }
            }
            else{
                return -1;
            }
        }
        catch(SQLException e){
            e.printStackTrace();
            return -2;
        }
    }

    /*
     * This method retrieves all user information from the database based on the provided username.
     * It returns a User model object containing the user information if the username is found in the database.
     * Otherwise, it returns null.
     */
    public User getUserByUsername(String username){

        try{
            Connection con = DatabaseConnection.getDatabaseConnection();
            PreparedStatement ps = con.prepareStatement(StringUtils.GET_USER_BY_USERNAME);
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            User userInfo = new User();

            while(rs.next()) {
                userInfo.setUserID(rs.getInt("UserID"));
                userInfo.setFirstName(rs.getString("FirstName"));
                userInfo.setLastName(rs.getString("LastName"));
                userInfo.setEmailAddress(rs.getString("EmailAddress"));
                userInfo.setPassword(rs.getString("Password"));
                userInfo.setPhoneNumber(rs.getString("PhoneNumber"));
                userInfo.setUsername(rs.getString("Username"));
                userInfo.setUserImage(rs.getString("Image"));
            }
            return userInfo;
        }
        catch(SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }


}
