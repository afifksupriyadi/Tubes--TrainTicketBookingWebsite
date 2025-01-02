/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Ticket;

/**
 *
 * @author LENOVO
 */
public class TicketDAO {

    private final String DB_URL = "jdbc:mysql://localhost:3306/keretakuy";
    private final String DB_USER = "root";
    private final String DB_PASSWORD = "";

    public boolean insertTicket(Ticket ticket) {
        String query = "INSERT INTO TicketBooked (idUser, idPenumpang, idKereta, idStasiunAsal, idStasiunTujuan, "
                + "departureTime, arrivalTime, tanggalKeberangkatan, harga, waktuBooking) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement statement = connection.prepareStatement(query);

            statement.setInt(1, ticket.getIdUser());
            statement.setInt(2, ticket.getIdPenumpang());
            statement.setInt(3, ticket.getIdKereta());
            statement.setInt(4, ticket.getIdStasiunAsal());
            statement.setInt(5, ticket.getIdStasiunTujuan());
            statement.setString(6, ticket.getDepartureTime());
            statement.setString(7, ticket.getArrivalTime());
            statement.setString(8, ticket.getTanggalKeberangkatan());
            statement.setInt(9, ticket.getHarga());
            statement.setTimestamp(10, java.sql.Timestamp.valueOf(ticket.getWaktuBooking()));

            int rowsInserted = statement.executeUpdate();

            statement.close();
            connection.close();

            return rowsInserted > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Ticket> getTicketsByUserId(int userId) {
        List<Ticket> tickets = new ArrayList<>();
        String query = "SELECT "
                + "tb.idBooked, tb.idUser, u.nama AS namaPembeli, tb.idPenumpang, p.namaPenumpang, "
                + "tb.idKereta, k.nama AS namaKereta, tb.idStasiunAsal, s1.nama AS stasiunAsal, "
                + "tb.idStasiunTujuan, s2.nama AS stasiunTujuan, tb.departureTime, tb.arrivalTime, "
                + "tb.tanggalKeberangkatan, tb.harga, tb.waktuBooking "
                + "FROM TicketBooked tb "
                + "JOIN User u ON tb.idUser = u.idUser "
                + "JOIN Penumpang p ON tb.idPenumpang = p.idPenumpang "
                + "JOIN Kereta k ON tb.idKereta = k.idKereta "
                + "JOIN Stasiun s1 ON tb.idStasiunAsal = s1.idStasiun "
                + "JOIN Stasiun s2 ON tb.idStasiunTujuan = s2.idStasiun "
                + "WHERE tb.idUser = ? ORDER BY tb.waktuBooking DESC";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); 
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Ticket ticket = new Ticket(
                        resultSet.getInt("idBooked"),
                        resultSet.getInt("idUser"),
                        resultSet.getString("namaPenumpang"),
                        resultSet.getString("namaKereta"),
                        resultSet.getString("stasiunAsal"),
                        resultSet.getString("stasiunTujuan"),
                        resultSet.getString("departureTime"),
                        resultSet.getString("arrivalTime"),
                        resultSet.getString("tanggalKeberangkatan"),
                        resultSet.getInt("harga"),
                        resultSet.getTimestamp("waktuBooking").toLocalDateTime()
                );
                tickets.add(ticket);
            }
        } catch (SQLException e) {
            System.err.println("Error in getTicketsByUserId: " + e.getMessage());
            e.printStackTrace();
        }
        return tickets;
    }

}
