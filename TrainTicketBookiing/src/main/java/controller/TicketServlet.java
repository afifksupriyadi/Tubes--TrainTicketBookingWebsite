/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.TicketDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Ticket;
import model.User;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "TicketServlet", urlPatterns = {"/myticket"})
public class TicketServlet extends HttpServlet {

    private TicketDAO ticketDAO;

    public TicketServlet() {
        this.ticketDAO = new TicketDAO();
    }

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
            List<Ticket> tickets = ticketDAO.getTicketsByUserId(user.getIdUser());
            request.setAttribute("tickets", tickets);

            if (tickets == null || tickets.isEmpty()) {
                System.out.println("No tickets found for userId: " + user.getIdUser());
                request.setAttribute("error", "No tickets found.");
                response.sendRedirect("error.jsp");
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
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
