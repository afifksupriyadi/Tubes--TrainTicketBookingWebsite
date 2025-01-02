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

    public void updateCapacity(int nomorKereta, String stasiunAsal, String stasiunTujuan, String tanggal, int jumlahPenumpang) throws SQLException {
        String query = "UPDATE Rute r "
                + "JOIN Kereta k ON r.idKereta = k.idKereta "
                + "SET r.capacity = r.capacity - ? "
                + "WHERE k.idKereta = ? "
                + "  AND r.date = ? "
                + "  AND r.idRute BETWEEN "
                + "      (SELECT MIN(idRute) FROM Rute WHERE idKereta = k.idKereta "
                + "         AND idStasiunAsal = (SELECT idStasiun FROM Stasiun WHERE nama = ?) "
                + "         AND date = ?) "
                + "      AND "
                + "      (SELECT MAX(idRute) FROM Rute WHERE idKereta = k.idKereta "
                + "         AND idStasiunTujuan = (SELECT idStasiun FROM Stasiun WHERE nama = ?) "
                + "         AND date = ?)";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, jumlahPenumpang);
            statement.setInt(2, nomorKereta);
            statement.setString(3, tanggal);
            statement.setString(4, stasiunAsal);
            statement.setString(5, tanggal);
            statement.setString(6, stasiunTujuan);
            statement.setString(7, tanggal);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected == 0) {
                throw new SQLException("Kapasitas tidak dapat diperbarui.");
            }
        }
    }
    
    public int getIdStasiunByName(String namaStasiun) throws SQLException {
    String query = "SELECT idStasiun FROM Stasiun WHERE nama = ?";
    try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
         PreparedStatement statement = connection.prepareStatement(query)) {
        statement.setString(1, namaStasiun);
        try (ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt("idStasiun");
            }
        }
    }
    throw new SQLException("ID Stasiun tidak ditemukan untuk nama: " + namaStasiun);
}


}
