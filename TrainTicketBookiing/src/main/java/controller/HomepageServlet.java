/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RuteDAO;
import dao.StasiunDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Stasiun;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "HomepageServlet", urlPatterns = {"/homepage"})
public class HomepageServlet extends HttpServlet {
    private StasiunDAO stasiunDAO;
    private RuteDAO ruteDAO;

    public HomepageServlet() {
        super();
        this.stasiunDAO = new StasiunDAO();
        this.ruteDAO = new RuteDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch station names and dates
        List<Stasiun> stationList = stasiunDAO.getListStations();
        List<String> dateList = ruteDAO.getListDatesOnDatabase();

        // Pass data to the JSP
        request.setAttribute("stations", stationList);
        request.setAttribute("dates", dateList);

        // Forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("homepage.jsp");
        dispatcher.forward(request, response);
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
