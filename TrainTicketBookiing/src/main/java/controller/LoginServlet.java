/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.LoginDAO;
import dao.RegisterDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/"})
public class LoginServlet extends HttpServlet {

    private RegisterDAO registerDAO;
    private LoginDAO loginDAO;

    public LoginServlet() {
        this.registerDAO = new RegisterDAO();
        this.loginDAO = new LoginDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/insert":
                insertUser(request, response); // Handles user registration
                break;
            case "/login":
                loginUser(request, response); // Handles user login
                break;
            case "/logout":
                logoutUser(request, response); // Handles user logout
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    // Registration Logic
    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nama = request.getParameter("nama");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String tanggalLahir = request.getParameter("tanggal");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create a User object
        User user = new User(nama, email, gender, tanggalLahir, username, password);
        boolean result = registerDAO.registerUser(user);

        if (result) {
            response.sendRedirect("registration-success.jsp");
        } else {
            response.sendRedirect("registration-error.jsp");
        }
    }

    // Login Logic
    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create a User object for login validation
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        // Gunakan metode getUserIfValid untuk mendapatkan data lengkap pengguna
        User loggedInUser = loginDAO.getUserIfValid(user);

        if (loggedInUser != null) {
            // Simpan objek User lengkap dalam sesi
            HttpSession session = request.getSession();
            session.setAttribute("user", loggedInUser);

            // Redirect ke homepage
            response.sendRedirect("homepage");
        } else {
            // Jika login gagal
            response.sendRedirect("login.jsp?error=invalid");
        }

    }

    // Logout Logic
    private void logoutUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Invalidate HTTP session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Prevent cached access
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        // Redirect to login page
        response.sendRedirect("login.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

}
