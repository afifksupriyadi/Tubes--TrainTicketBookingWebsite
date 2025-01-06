/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Aydin Shidqi
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/user", "/edit"})
public class UserServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/user":
                showUser(request, response); // Handles show user
                break;
            case "/edit":
                editUser(request, response); // Handles edit user 
                break;
        }
    }

    protected void showUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userDAO.getUserById(id);

        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else {
            response.getWriter().println("User not found");
        }
    }

    protected void editUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        String nama = request.getParameter("nama");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String tanggalLahir = request.getParameter("tanggalLahir");
        String username = request.getParameter("username");
        String password = request.getParameter("passwrd");

        boolean usernameExists = userDAO.checkUserIfExist(username);

        if (usernameExists) {
            // Jika username sudah digunakan oleh user lain
            response.sendRedirect("user?id=" + idUser + "&error=Username+sudah+ada+yang+dipakai");
            return;
        }
        User user = new User(idUser, nama, email, gender, tanggalLahir, username, password);
        boolean updated = userDAO.updateUser(user);

        if (updated) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("user?id=" + idUser);
        } else {
            response.getWriter().println("Failed to update user");
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
