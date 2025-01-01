/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ListKereta;
import model.User;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "BookingServlet", urlPatterns = {"/booking"})
public class BookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Ambil data user dari session
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        // Redirect ke login jika session user tidak ditemukan
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Ambil data kereta dari parameter request
            String namaKereta = request.getParameter("namaKereta");
            String nomorKeretaParam = request.getParameter("nomorKereta");
            String stasiunAsal = request.getParameter("stasiunAsal");
            String stasiunTujuan = request.getParameter("stasiunTujuan");
            String departureTime = request.getParameter("departureTime");
            String arrivalTime = request.getParameter("arrivalTime");
            String availableCapacityParam = request.getParameter("availableCapacity");
            String totalDistanceParam = request.getParameter("totalDistance");
            String hargaParam = request.getParameter("harga");
            String tanggalKeberangkatan = request.getParameter("tanggalKeberangkatan");
            String jumlahPenumpangParam = request.getParameter("jumlahPenumpang");

            // Validasi null atau kosong
            if (namaKereta == null || nomorKeretaParam == null || stasiunAsal == null
                    || stasiunTujuan == null || departureTime == null || arrivalTime == null
                    || availableCapacityParam == null || totalDistanceParam == null || hargaParam == null
                    || tanggalKeberangkatan == null || jumlahPenumpangParam == null) {
                throw new IllegalArgumentException("Parameter tidak lengkap atau null.");
            }

            // Parse integer setelah validasi
            int nomorKereta = Integer.parseInt(nomorKeretaParam);
            int availableCapacity = Integer.parseInt(availableCapacityParam);
            int totalDistance = Integer.parseInt(totalDistanceParam);
            int harga = Integer.parseInt(hargaParam);
            int jumlahPenumpang = Integer.parseInt(jumlahPenumpangParam);

            // Simpan data kereta dalam sesi
            ListKereta kereta = new ListKereta(
                    namaKereta, nomorKereta, stasiunAsal, stasiunTujuan,
                    departureTime, arrivalTime, availableCapacity,
                    tanggalKeberangkatan, totalDistance, harga
            );
            session.setAttribute("kereta", kereta);

            // Kirim data ke JSP
            request.setAttribute("user", user);
            request.setAttribute("kereta", kereta);
            request.setAttribute("jumlahPenumpang", jumlahPenumpang);

            // Redirect ke booking-tiket.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("booking-tiket-2.jsp");
            dispatcher.forward(request, response);

        } catch (NumberFormatException e) {
            response.getWriter().println("Kesalahan format angka: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            response.getWriter().println("Kesalahan: " + e.getMessage());
        } catch (Exception e) {
            response.getWriter().println("Terjadi kesalahan: " + e.getMessage());
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
