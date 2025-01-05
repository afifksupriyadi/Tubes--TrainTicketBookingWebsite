/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import dao.PenumpangDAO;
import model.Penumpang;
import model.User;

/**
 *
 * @author Aydin Shidqi
 */
@WebServlet(name = "PenumpangServlet", urlPatterns = {"/showPenumpang", "/editPenumpang", "/showEditPenumpang"})
public class PenumpangServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/showPenumpang":
                showPenumpang(request, response);
                break;
            case "/showEditPenumpang":
                showEditPenumpang(request, response);
                break;
            case "/editPenumpang":
                editPenumpang(request, response);
                break;
        }
    }

    protected void showPenumpang(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            int idUser = Integer.parseInt(request.getParameter("id"));
            // Ambil data penumpang dari database
            List<Penumpang> penumpangList = new PenumpangDAO().getPenumpangById(idUser);

            // Set data penumpang ke request attribute
            request.setAttribute("penumpangList", penumpangList);

            // Redirect ke penumpang.jsp
            request.getRequestDispatcher("penumpang.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving passenger data.");
        }
    }

    protected void showEditPenumpang(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int idPenumpang = Integer.parseInt(request.getParameter("id"));
            // Ambil data penumpang dari database
            Penumpang penumpang = new PenumpangDAO().getPenumpang(idPenumpang);
            // Set data penumpang ke request attribute
            request.setAttribute("penumpang", penumpang);

            // Redirect ke penumpang.jsp
            request.getRequestDispatcher("edit-Penumpang.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving passenger data.");
        }
    }

    protected void editPenumpang(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idPenumpang = Integer.parseInt(request.getParameter("id"));
        String namaPenumpang = request.getParameter("namaPenumpang");
        String emailPenumpang = request.getParameter("emailPenumpang");

        User user = (User) request.getSession().getAttribute("user");

        Penumpang penumpang = new Penumpang(idPenumpang, namaPenumpang, emailPenumpang);
        new PenumpangDAO().updatePenumpang(penumpang);

        response.sendRedirect("showPenumpang?id=" + user.getIdUser());
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
