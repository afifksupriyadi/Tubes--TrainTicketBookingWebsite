/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.PenumpangDAO;
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
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.ListKereta;
import model.Penumpang;
import model.Ticket;
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
            // Ambil data kereta yang telah dklik oleh pengguna: Kereta yang ingin dipesan setelah tombol "Reservasi" diklik
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
            // Panggil RuteDAO untuk mendapatkan idStasiun
            // Tujuannya untuk mengetahui idStasiun asal dan tujuan sesuai dengan nama stasiun yang dipilih pada kereta yang ingin dipesan 
            RuteDAO ruteDAO = new RuteDAO();
            int idStasiunAsal = ruteDAO.getIdStasiunByName(stasiunAsal);
            int idStasiunTujuan = ruteDAO.getIdStasiunByName(stasiunTujuan);

            // Validasi jika ada parameter yang tidak berhasil diambil atau data null 
            if (namaKereta == null || nomorKeretaParam == null || stasiunAsal == null
                    || stasiunTujuan == null || departureTime == null || arrivalTime == null
                    || availableCapacityParam == null || totalDistanceParam == null || hargaParam == null
                    || tanggalKeberangkatan == null || jumlahPenumpangParam == null) {
                throw new IllegalArgumentException("Parameter tidak lengkap atau null.");
            }
            // Parse integer setelah validasi
            // Data angka dari JSP yg masih String akan dikonversi menjadi Integer
            int nomorKereta = Integer.parseInt(nomorKeretaParam);
            int availableCapacity = Integer.parseInt(availableCapacityParam);
            int totalDistance = Integer.parseInt(totalDistanceParam);
            int harga = Integer.parseInt(hargaParam);
            int jumlahPenumpang = Integer.parseInt(jumlahPenumpangParam);

            // Simpan data kereta yang dipilih ke dalam sesi "kereta", gunakan model ListKereta
            ListKereta kereta = new ListKereta(
                    namaKereta, nomorKereta, stasiunAsal, stasiunTujuan,
                    departureTime, arrivalTime, availableCapacity,
                    tanggalKeberangkatan, totalDistance, harga
            );
            kereta.setIdStasiunAsal(idStasiunAsal);
            kereta.setIdStasiunTujuan(idStasiunTujuan);
            session.setAttribute("kereta", kereta);

            // Siapkan sesi datau data untuk dikirim ke JSP: user, kereta, dan jumlah penumpang
            // User: user yang sedang aktif, dalam hal ini adalah user yang akan memesan kereta
            // Kereta: kereta yang dipilih oleh user, dalam hal ini adalah jadwal atau tiket yang dipilih dan ingin diproses lebih lanjut untuk pemesanan
            // Jummlah penumpang: data jumlah penumpang yang dimasukkan pengguna, akan digunakan pada doPost untuk membuat form data penumpang
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
        // Ambil data user dari session
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        try {
            // Ambil data kereta yang telah disiapkan oleh doGet di dalam servlet ini
            ListKereta kereta = (ListKereta) session.getAttribute("kereta");
            if (kereta == null) {
                throw new IllegalArgumentException("Data kereta tidak ditemukan di sesi.");
            }

            // Ambil data data penumpang yang telah disiapkan oleh doGet di dalam servlet ini
            String jumlahPenumpangStr = request.getParameter("jumlahPenumpang");
            if (jumlahPenumpangStr == null || jumlahPenumpangStr.isEmpty()) {
                throw new IllegalArgumentException("Jumlah penumpang tidak boleh kosong. Debug: " + jumlahPenumpangStr);
            }
            int jumlahPenumpang = Integer.parseInt(jumlahPenumpangStr);
            // Validasi jumlah penumpang
            if (jumlahPenumpang <= 0 || jumlahPenumpang > kereta.getAvailableCapacity()) {
                throw new IllegalArgumentException("Jumlah penumpang tidak valid.");
            }
                      
            // LOGIKA PROSES BOOKING
            // Inisiasi DAO yang diperlukan
            PenumpangDAO penumpangDAO = new PenumpangDAO();
            TicketDAO ticketDAO = new TicketDAO();
            RuteDAO ruteDAO = new RuteDAO();
            
            // STEP (1): Add data penumpang to Table Penumpang
            // Proses data penumpang
            List<Penumpang> penumpangList = new ArrayList<>();
            for (int i = 1; i <= jumlahPenumpang; i++) {
                String nama = request.getParameter("namaPenumpang" + i);
                String email = request.getParameter("emailPenumpang" + i);

                if (nama == null || email == null || nama.isEmpty() || email.isEmpty()) {
                    throw new IllegalArgumentException("Data penumpang tidak lengkap.");
                }
                
                // Create model pennumpang
                Penumpang penumpang = new Penumpang(nama, email, user.getIdUser());
                // Tambahkan penumpang i ke database
                int idPenumpang = penumpangDAO.insertPenumpang(penumpang); // Simpan ke database
                // Set ID setelah insert
                penumpang.setIdPenumpang(idPenumpang);
                // Tambahkan ke List Penumpang
                penumpangList.add(penumpang);
            }
            
            // STEP (2): Add data tiket ke Table Tiket
            for (Penumpang penumpang : penumpangList) {
                Ticket ticket = new Ticket(
                        user.getIdUser(),
                        penumpang.getIdPenumpang(),
                        kereta.getNomorKereta(), // Ambil ID kereta dari objek ListKereta
                        kereta.getIdStasiunAsal(), // Method untuk mendapatkan ID Stasiun Asal
                        kereta.getIdStasiunTujuan(), // Method untuk mendapatkan ID Stasiun Tujuan
                        kereta.getDepartureTime(),
                        kereta.getArrivalTime(),
                        kereta.getTanggalKeberangkatan(),
                        kereta.getHarga(),
                        LocalDateTime.now()
                );
                // Simpan data tiket ke database
                ticketDAO.insertTicket(ticket); 
            }
            
            // STEP (3): Update kapasitas kursi, sesuai dengan banyaknya jumlah penumpang yang dimasukkan
            // Update di sini adalah pengurangan kapasitas kursi pada Table Rute
            ruteDAO.updateCapacity(
                    kereta.getNomorKereta(),
                    kereta.getStasiunAsal(),
                    kereta.getStasiunTujuan(),
                    kereta.getTanggalKeberangkatan(),
                    jumlahPenumpang
            );

            // Redirect ke halaman sukses
            response.sendRedirect("booking-success.jsp");
        } catch (NumberFormatException e) {
            response.getWriter().println("Kesalahan format angka: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            response.getWriter().println("Kesalahan: " + e.getMessage());
        } catch (Exception e) {
            response.getWriter().println("Terjadi kesalahan: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
