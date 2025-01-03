/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import model.User;

/**
 *
 * @author LENOVO
 */
public class LoginDAO {

    private final String DB_URL = "jdbc:mysql://localhost:3306/keretakuy";
    private final String DB_USER = "root";
    private final String DB_PASSWORD = "";
    
    public User getUserIfValid(User user) {
        User retrievedUser = null;
        try {
            // Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish database connection
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare SQL query
            String query = "SELECT * FROM user WHERE username=? AND passwrd=?";
            PreparedStatement statement = connection.prepareStatement(query);

            // Set parameters
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());

            // Execute query
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                // Create a User object from the result set
                retrievedUser = new User(
                        rs.getInt("idUser"),
                        rs.getString("nama"),
                        rs.getString("email"),
                        rs.getString("gender"),
                        rs.getString("tanggalLahir"),
                        rs.getString("username"),
                        rs.getString("passwrd")
                );
            }
            System.out.println("Running query: " + query);


            // Close resources
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return retrievedUser;
    }

}
