<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="model.User, model.ListKereta" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    
    // Check if the user session exists
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
  
    // Ambil data kereta, user, dan jumlah penumpang dari request
    ListKereta kereta = (ListKereta) request.getAttribute("kereta");
    int jumlahPenumpang = (Integer) request.getAttribute("jumlahPenumpang");
    // Perhitungan total harga
    int totalHarga = kereta.getHarga() * jumlahPenumpang;
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Booking Tiket</title>
    <link rel="stylesheet" href="CSS/css-booking-tiket.css">
</head>
<body>
    <div class="booking-container">
        <!-- Informasi Kereta -->
        <div class="info-kereta">
            <div class="kereta-detail">
                <h3>${kereta.getNamaKereta()} (${kereta.getNomorKereta()})</h3>
                <div class="detail">
                    <p><strong>Stasiun Asal:</strong> ${kereta.getStasiunAsal()}</p>
                    <p><strong>Stasiun Tujuan:</strong> ${kereta.getStasiunTujuan()}</p>
                    <p><strong>Keberangkatan:</strong> ${kereta.getDepartureTime()}</p>
                    <p><strong>Kedatangan:</strong> ${kereta.getArrivalTime()}</p>
                </div>
            </div>
            <div class="harga-tiket">
                <h3>Rincian Biaya</h3>
                <p><strong>Harga Tiket:</strong> Rp ${kereta.getHarga()}</p>
                <p><strong>Jumlah Tiket:</strong> x${jumlahPenumpang}</p>
                <h3>Total: Rp <%= totalHarga %></h3>
            </div>
        </div>

        <!-- Form Data Penumpang -->
        <div class="form-penumpang">
            <h3>Data Penumpang</h3>
            <form action="process-booking" method="post">
                <% for (int i = 1; i <= jumlahPenumpang; i++) { %>
                    <div class="penumpang">
                        <h4>Data Penumpang <%= i %></h4>
                        <div class="form-group">
                            <label for="namaPenumpang<%= i %>">Nama Penumpang</label>
                            <input type="text" name="namaPenumpang<%= i %>" id="namaPenumpang<%= i %>" value="<%= user.getNama() %>" required>
                        </div>
                        <div class="form-group">
                            <label for="emailPenumpang<%= i %>">Email</label>
                            <input type="email" name="emailPenumpang<%= i %>" id="emailPenumpang<%= i %>" value="<%= user.getEmail() %>" required>
                        </div>
                    </div>
                <% } %>
                <div class="submit-container">
                    <button type="submit" class="btn-pesan">Pesan</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
