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
    
    public boolean validate(User user) {
        boolean status = false;
        
        try {
            // Step 1: Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Step 2: Establish database connection
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            // Step 3: Prepare SQL query
            String query = "SELECT * FROM user WHERE username=? AND passwrd=?";
            PreparedStatement statement = connection.prepareStatement(query);
            
            // Step 4: Set parameters
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            
            // Step 5: Execute query
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                status = true;
            }
            
            // Step 6: Close connection
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return status;
    }
}
