/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class RuteDAO {
    private final String DB_URL = "jdbc:mysql://localhost:3306/keretakuy"; 
    private final String DB_USER = "root"; 
    private final String DB_PASSWORD = ""; 

    public List<String> getListDatesOnDatabase() {
        List<String> dates = new ArrayList<>();
        String query = "SELECT DISTINCT date FROM Rute ORDER BY date ASC";
        
        try {
            // Step 1: Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Step 2: Establish database connection
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Step 3: Prepare SQL query
            PreparedStatement statement = connection.prepareStatement(query);

            // Step 4: Execute query
            ResultSet rs = statement.executeQuery();

            // Step 5: Process the ResultSet
            while (rs.next()) {
                String date = rs.getString("date");
                dates.add(date);
            }

            // Step 6: Close resources
            rs.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dates; // Step 7: Return the list of dates
    }
}
