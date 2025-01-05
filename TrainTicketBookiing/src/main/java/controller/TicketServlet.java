/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RuteDAO;
import dao.TicketDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import model.Ticket;
import model.User;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "TicketServlet", urlPatterns = {"/myticket"})
public class TicketServlet extends HttpServlet {

//    private TicketDAO ticketDAO;
//    private RuteDAO ruteDAO;
//
//    public TicketServlet() {
//        this.ticketDAO = new TicketDAO();
//        this.ruteDAO = new RuteDAO();
//    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Ambil daftar tiket berdasarkan ID pengguna
            TicketDAO ticketDAO = new TicketDAO();
            List<Ticket> tickets = ticketDAO.getTicketsByUserId(user.getIdUser());
            request.setAttribute("tickets", tickets);

            if (tickets == null || tickets.isEmpty()) {
                System.out.println("No tickets found for userId: " + user.getIdUser());
                request.setAttribute("error", "No tickets found.");
                response.sendRedirect("myticket-2.jsp");
                return;
            }

            // Forward ke halaman myticket.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("myticket-2.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Ambil idBooked dari parameter
            String idBookedParam = request.getParameter("idBooked");
            if (idBookedParam == null || idBookedParam.isEmpty()) {
                throw new IllegalArgumentException("ID Tiket tidak valid.");
            }

            int idBooked = Integer.parseInt(idBookedParam);

            // Ambil detail tiket berdasarkan idBooked menggunakan TicketDAO
            TicketDAO ticketDAO = new TicketDAO();
            RuteDAO ruteDAO = new RuteDAO();
            Ticket ticket = ticketDAO.getTicketById(idBooked);

            if (ticket == null) {
                throw new IllegalArgumentException("Tiket tidak ditemukan.");
            }

            // Langkah 1: Hapus tiket dari tabel TicketBooked
            boolean isDeleted = ticketDAO.deleteTicketById(idBooked);
            if (!isDeleted) {
                throw new SQLException("Gagal menghapus tiket.");
            }

            // Langkah 2: Update kapasitas kursi di tabel Rute
            ruteDAO.updateCapacityAdd(
                    ticket.getIdKereta(),
                    ticket.getIdStasiunAsal(),
                    ticket.getIdStasiunTujuan(),
                    ticket.getTanggalKeberangkatan(),
                    1 // Kapasitas bertambah 1 kursi
            );

            // Redirect ke halaman myticket.jsp
            response.sendRedirect("myticket");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
