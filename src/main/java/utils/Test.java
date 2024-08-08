package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class Test {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println("Enter first name:");
        String firstName = sc.nextLine();
        System.out.println("Enter last name:");
        String lastName = sc.nextLine();
        System.out.println("Enter email address:");
        String email = sc.nextLine();
        System.out.println("Enter password:");
        String password = sc.nextLine();
        System.out.println("Enter phone number:");
        String phoneNumber = sc.nextLine();
        System.out.println("Enter username:");
        String username = sc.nextLine();

        try{
            Connection con = DatabaseConnection.getDatabaseConnection();
            PreparedStatement ps = con.prepareStatement(StringUtils.INSERT_USER);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, phoneNumber);
            ps.setString(6, username);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("User added successfully");
            }
            else{
                System.out.println("User not added successfully");
            }
        }
        catch(SQLException | ClassNotFoundException e){
            System.out.println("Unable to connect to database");
            System.out.println(e.getMessage());
        }

    }
}
