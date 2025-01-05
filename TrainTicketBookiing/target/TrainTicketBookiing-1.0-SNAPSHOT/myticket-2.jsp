<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My Tickets</title>
        <style>
            header {
                background-color: #ffffff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                padding: 10px 20px;
                display: flex;
                align-items: center;
                position: sticky;
                top: 0;
                z-index: 1000;
                justify-content: center; /* Memusatkan konten header */
            }

            .header-logo {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .header-logo img {
                height: 40px;
            }

            .header-logo h1 {
                font-size: 22px;
                color: #0C77AC;
                font-weight: bold;
                margin: 0;
            }

            .header-line {
                width: 100%;
                height: 2px;
                background-color: #0C77AC;
            }
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f7f7f7;
            }
            .container {
                width: 80%;
                margin: 20px auto;
                background: white;
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #0C77AC;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                text-align: left;
                padding: 8px;
                border: 1px solid #ddd;
            }
            th {
                background-color: #0C77AC;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            .footer {
                text-align: center;
                margin-top: 20px;
            }
            .footer a {
                text-decoration: none;
                padding: 10px 20px;
                color: white;
                background-color: #0C77AC;
                border-radius: 5px;
            }
            .footer a:hover {
                background-color: #005f8b;
            }
        </style>
        <script>
            function confirmCancel(event) {
                if (!confirm("Are you sure you want to cancel this ticket?")) {
                    event.preventDefault();
                }
            }
        </script>
    </head>
    <body>
        <header>
            <div class="header-logo">
                <img src="Asset/train-navbar.png" alt="Train Logo">
                <h1>Kereta Kuy</h1>
            </div>
        </header>
        <div class="header-line"></div>
        <div class="container">
            <h1>My Tickets</h1>
            <c:if test="${not empty tickets}">
                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nama Penumpang</th>
                            <th>Kereta</th>
                            <th>Stasiun Asal</th>
                            <th>Stasiun Tujuan</th>
                            <th>Jam Keberangkatan</th>
                            <th>Jam Tiba</th>
                            <th>Tanggal Keberangkatan</th>
                            <th>Waktu Booking</th>
                            <th>Harga</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="ticket" items="${tickets}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${ticket.namaPenumpang}</td>
                                <td>${ticket.namaKereta}</td>
                                <td>${ticket.namaStasiunAsal}</td>
                                <td>${ticket.namaStasiunTujuan}</td>
                                <td>${ticket.departureTime}</td>
                                <td>${ticket.arrivalTime}</td>
                                <td>${ticket.tanggalKeberangkatan}</td>
                                <td>${ticket.waktuBooking}</td>
                                <td>Rp ${ticket.harga}</td>
                                <td>
                                    <form action="myticket" method="post" onsubmit="confirmCancel(event)">
                                        <input type="hidden" name="idBooked" value="${ticket.idBooked}">
                                        <input type="hidden" name="idKereta" value="${ticket.idKereta}">
                                        <input type="hidden" name="idStasiunAsal" value="${ticket.idStasiunAsal}">
                                        <input type="hidden" name="idStasiunTujuan" value="${ticket.idStasiunTujuan}">
                                        <input type="hidden" name="tanggalKeberangkatan" value="${ticket.tanggalKeberangkatan}">
                                        <button type="submit">Cancel Ticket</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty tickets}">
                <p style="text-align:center;">You have no tickets booked yet.</p>
            </c:if>
            <div class="footer">
                <a href="homepage">Back to Homepage</a>
            </div>
        </div>
    </body>
</html>
