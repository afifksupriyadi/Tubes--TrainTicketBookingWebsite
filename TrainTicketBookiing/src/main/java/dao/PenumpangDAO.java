/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Penumpang;
import java.sql.*;

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
}
