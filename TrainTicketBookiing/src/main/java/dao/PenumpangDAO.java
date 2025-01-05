/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Penumpang;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class PenumpangDAO {
    private final String DB_URL = "jdbc:mysql://localhost:3306/keretakuy";
    private final String DB_USER = "root";
    private final String DB_PASSWORD = "";

    public int insertPenumpang(Penumpang penumpang) throws SQLException {
        String query = "INSERT INTO Penumpang (namaPenumpang, emailPenumpang, idUser) VALUES (?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, penumpang.getNamaPenumpang());
            stmt.setString(2, penumpang.getEmailPenumpang());
            stmt.setInt(3, penumpang.getIdUser());

            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return -1;
    }
    
    public List<Penumpang> getPenumpangById(int idUser) {
        List<Penumpang> penumpangList = new ArrayList<>();
        String query = "SELECT * FROM penumpang WHERE idUser = ?";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, idUser);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Penumpang penumpang = new Penumpang(
                        resultSet.getInt("idPenumpang"),
                        resultSet.getString("namaPenumpang"),
                        resultSet.getString("emailPenumpang"),
                        resultSet.getInt("IdUser")
                );
                penumpangList.add(penumpang);
            }
        } catch (SQLException e) {
            System.err.println("Error in getPenumpang: " + e.getMessage());
            e.printStackTrace();
        }
        return penumpangList;
    }

    public Penumpang getPenumpang(int idPenumpang) {
        String query = "SELECT * FROM penumpang WHERE idPenumpang = ?";
        Penumpang penumpang = null;

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, idPenumpang);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    penumpang = new Penumpang(
                            resultSet.getInt("idPenumpang"),
                            resultSet.getString("namaPenumpang"),
                            resultSet.getString("emailPenumpang"),
                            resultSet.getInt("idUser")
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println("Error in getPenumpang: " + e.getMessage());
            e.printStackTrace();
        }
        return penumpang;
    }

    public boolean updatePenumpang(Penumpang penumpang) {
        boolean status = false;

        try {
            // Step 1: Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Step 2: Establish database connection
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Step 3: Prepare SQL query
            String sql = "UPDATE penumpang SET namaPenumpang = ?, emailPenumpang = ? WHERE idPenumpang = ?";
            PreparedStatement statement = connection.prepareStatement(sql);

            // Step 4: Set parameters
            statement.setString(1, penumpang.getNamaPenumpang());
            statement.setString(2, penumpang.getEmailPenumpang());
            statement.setInt(3, penumpang.getIdPenumpang());

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

    public boolean deletePenumpang(int idPenumpang) {
        String query = "DELETE FROM penumpang WHERE idPenumpang = ?";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, idPenumpang);
            int rowsDeleted = statement.executeUpdate();

            return rowsDeleted > 0;

        } catch (SQLException e) {
            System.err.println("Error in deletePenumpang: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
