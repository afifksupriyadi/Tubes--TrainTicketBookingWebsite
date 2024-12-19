/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.ListKereta;

/**
 *
 * @author LENOVO
 */
public class SearchingDAO {

    // Database connection details
    private final String DB_URL = "jdbc:mysql://localhost:3306/keretakuy";
    private final String DB_USER = "root";
    private final String DB_PASSWORD = "";

    public List<ListKereta> searchKereta(String stasiunAsal, String stasiunTujuan, String tanggal, int jumlahPenumpang) {
        List<ListKereta> results = new ArrayList<>();

        String query = "SELECT "
                + "k.nama AS namaKereta, "
                + "k.idKereta AS nomorKereta, "
                + "s1.nama AS stasiunAsal, "
                + "s2.nama AS stasiunTujuan, "
                + "MIN(r1.departureTime) AS departureTime, "
                + "MAX(r2.arrivalTime) AS arrivalTime, "
                + "MIN(r1.capacity) AS availableCapacity, "
                + "SUM(rJoin.distance) AS totalDistance, "
                + "(SUM(rJoin.distance) * k.hargaKereta) AS harga, "
                + "r1.date AS tanggalKeberangkatan " // Tambahkan kolom ini
                + "FROM Rute r1 "
                + "JOIN Rute r2 ON r1.idKereta = r2.idKereta "
                + "JOIN Kereta k ON r1.idKereta = k.idKereta "
                + "JOIN Stasiun s1 ON r1.idStasiunAsal = s1.idStasiun "
                + "JOIN Stasiun s2 ON r2.idStasiunTujuan = s2.idStasiun "
                + "JOIN Rute rJoin ON r1.idKereta = rJoin.idKereta "
                + "AND rJoin.idRute BETWEEN r1.idRute AND r2.idRute "
                + "WHERE s1.nama = ? " // Stasiun Asal
                + "AND s2.nama = ? " // Stasiun Tujuan
                + "AND r1.date = ? " // Tanggal Keberangkatan
                + "AND r2.date = ? " // Tanggal Keberangkatan
                + "GROUP BY k.nama, s1.nama, s2.nama, r1.date, k.hargaKereta " // Tambahkan r1.date
                + "HAVING MIN(r1.capacity) >= ? " // Minimum kapasitas
                + "ORDER BY departureTime;";

        try {
            // Step 1: Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Step 2: Establish database connection
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Step 3: Prepare SQL query
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, stasiunAsal);
            statement.setString(2, stasiunTujuan);
            statement.setString(3, tanggal);
            statement.setString(4, tanggal);
            statement.setInt(5, jumlahPenumpang);

            // Step 4: Execute query
            ResultSet rs = statement.executeQuery();

            // Step 5: Process the ResultSet
            while (rs.next()) {
                String namaKereta = rs.getString("namaKereta");
                int nomorKereta = rs.getInt("nomorKereta");
                String asal = rs.getString("stasiunAsal");
                String tujuan = rs.getString("stasiunTujuan");
                String departureTime = rs.getString("departureTime");
                String arrivalTime = rs.getString("arrivalTime");
                int availableCapacity = rs.getInt("availableCapacity");
                String tanggalKeberangkatan = rs.getString("tanggalKeberangkatan");
                int totalDistance = rs.getInt("totalDistance");
                int harga = rs.getInt("harga");

                // Create a ResultTrain object and add it to the list
                ListKereta train = new ListKereta(
                        namaKereta, nomorKereta, asal, tujuan, departureTime,
                        arrivalTime, availableCapacity, tanggalKeberangkatan,
                        totalDistance, harga
                );
                results.add(train);
            }

            // Step 6: Close resources
            rs.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Step 7: Return the results
        return results;
    }
}
