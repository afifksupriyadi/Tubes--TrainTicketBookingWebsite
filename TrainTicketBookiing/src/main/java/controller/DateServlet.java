/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RuteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "DateServlet", urlPatterns = {"/available-dates"})
public class DateServlet extends HttpServlet {
    
    private RuteDAO ruteDAO;

    public DateServlet() {
        super();
        this.ruteDAO = new RuteDAO();
    }
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        List<String> availableDates = ruteDAO.getListDatesOnDatabase();

        // Convert dates to JSON format
        PrintWriter out = response.getWriter();
        out.print("[");
        for (int i = 0; i < availableDates.size(); i++) {
            out.print("\"" + availableDates.get(i) + "\"");
            if (i < availableDates.size() - 1) {
                out.print(",");
            }
        }
        out.print("]");
        out.flush();
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
