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
    int totalHarga = kereta.getHarga() * jumlahPenumpang;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Tiket</title>
        <link rel="stylesheet" href="CSS/css-booking-tiket-2.css">
    </head>
    <body>
        <div class="main-container">
            <!-- Informasi Kereta -->
            <div class="info-kereta">
                <div class="kereta-detail">
                    <h3>${kereta.getNamaKereta()} (${kereta.getNomorKereta()})</h3>
                    <div class="kereta-info">
                        <div class="info-section">
                            <img src="Asset/result-stasiun-keberangkatan.png" alt="Stasiun Keberangkatan">
                            <div>
                                <p>${kereta.getDepartureTime()}</p>
                                <p>${kereta.getStasiunAsal()}</p>
                            </div>
                        </div>
                        <div class="info-section">
                            <img src="Asset/result-to-station.png" alt="To">
                        </div>
                        <div class="info-section">
                            <img src="Asset/result-stasiun-tiba.png" alt="Stasiun Tujuan">
                            <div>
                                <p>${kereta.getArrivalTime()}</p>
                                <p>${kereta.getStasiunTujuan()}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="rincian-biaya">
                    <h3>Rincian Biaya</h3>
                    <p>Harga Tiket: <strong>Rp ${kereta.getHarga()}</strong></p>
                    <p>Jumlah Tiket: <strong>x${jumlahPenumpang}</strong></p>
                    <h3>Total: <strong>Rp <%= totalHarga%></strong></h3>
                </div>
            </div>

            <!-- Data Penumpang -->
            <div class="data-penumpang">
                <h3>Data Penumpang</h3>
                <form action="booking" method="post">
                    <input type="hidden" name="jumlahPenumpang" value="<%= jumlahPenumpang %>">
                    <% for (int i = 1; i <= jumlahPenumpang; i++) {%>
                    <div class="penumpang">
                        <h4>Data Penumpang <%= i%></h4>
                        <div class="form-group">
                            <label for="namaPenumpang<%= i%>">Nama Penumpang</label>
                            <input type="text" name="namaPenumpang<%= i%>" id="namaPenumpang<%= i%>" 
                                   value="<%= (i == 1) ? user.getNama() : ""%>" required>
                        </div>
                        <div class="form-group">
                            <label for="emailPenumpang<%= i%>">Email</label>
                            <input type="email" name="emailPenumpang<%= i%>" id="emailPenumpang<%= i%>" 
                                   value="<%= (i == 1) ? user.getEmail() : ""%>" required>
                        </div>
                    </div>
                    <% }%>
                    <div class="submit-container">
                        <button type="submit" class="btn-pesan">Pesan</button>
                    </div>
                </form>
            </div>
        </div>
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const bookingForm = document.querySelector("form");
                const submitButton = document.querySelector(".btn-pesan");

                submitButton.addEventListener("click", (event) => {
                    // Cek validitas form
                    if (!bookingForm.checkValidity()) {
                        // Jika form tidak valid, tampilkan pesan bawaan HTML5
                        bookingForm.reportValidity();
                        return;
                    }

                    // Jika form valid, tampilkan dialog konfirmasi
                    event.preventDefault(); // Prevent form submission
                    const userConfirmed = confirm("Apakah Anda yakin untuk memesan tiket ini?");
                    if (userConfirmed) {
                        bookingForm.submit(); // Submit form jika user mengonfirmasi
                    }
                });
            });
        </script>

    </body>
</html>
