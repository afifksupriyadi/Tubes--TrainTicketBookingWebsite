/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;

/**
 *
 * @author Aydin Shidqi
 */
public class UserDAO {

    private final String DB_URL = "jdbc:mysql://localhost:3306/keretakuy";
    private final String DB_USER = "root";
    private final String DB_PASSWORD = "";

    public User getUserById(int id) {
        User user = null;

        try {
            // Step 1: Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Step 2: Establish database connection
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Step 3: Prepare SQL query
            String sql = "SELECT * FROM user WHERE idUser = ?";
            PreparedStatement statement = connection.prepareStatement(sql);

            // Step 4: Set parameter
            statement.setInt(1, id);

            // Step 5: Execute query
            ResultSet resultSet = statement.executeQuery();

            // Step 6: Process result
            if (resultSet.next()) {
                user = new User(
                        resultSet.getInt("idUser"),
                        resultSet.getString("nama"),
                        resultSet.getString("email"),
                        resultSet.getString("gender"),
                        resultSet.getDate("tanggalLahir").toString(),
                        resultSet.getString("username"),
                        resultSet.getString("passwrd")
                );
            }

            // Step 7: Close connection
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {
        boolean status = false;

        try {
            // Step 1: Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Step 2: Establish database connection
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Step 3: Prepare SQL query
            String sql = "UPDATE user SET nama = ?, email = ?, gender = ?, tanggalLahir = ?, username = ?, passwrd = ? WHERE idUser = ?";
            PreparedStatement statement = connection.prepareStatement(sql);

            // Step 4: Set parameters
            statement.setString(1, user.getNama());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getGender());
            statement.setString(4, user.getTanggalLahir());
            statement.setString(5, user.getUsername());
            statement.setString(6, user.getPassword());
            statement.setInt(7, user.getIdUser());

            // Step 5: Execute update
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                status = true;
            }

            // Step 6: Close connection
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public boolean checkUserIfExist(String username) {
        boolean exists = false;

        try {
            // Step 1: Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Step 2: Establish database connection
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Step 3: Prepare SQL query
            String sql = "SELECT username FROM user WHERE username = ?";
            PreparedStatement statement = connection.prepareStatement(sql);

            // Step 4: Set parameter
            statement.setString(1, username);

            // Step 5: Execute query
            ResultSet resultSet = statement.executeQuery();

            // Step 6: Check result
            if (resultSet.next()) {
                exists = true;
            }
            // Step 7: Close connection
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return exists;
    }
}
