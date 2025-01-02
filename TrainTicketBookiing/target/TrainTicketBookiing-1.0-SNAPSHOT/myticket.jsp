<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Tickets</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f7f9fc;
                margin: 0;
                padding: 0;
            }
            header {
                background-color: #0c77ac;
                color: white;
                padding: 20px 0;
                text-align: center;
                font-size: 24px;
                font-weight: bold;
            }
            .container {
                max-width: 1200px;
                margin: 20px auto;
                padding: 20px;
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .ticket-card {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                border: 1px solid #ddd;
                border-radius: 8px;
                margin-bottom: 15px;
                padding: 20px;
                background-color: #fdfdfd;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
                transition: transform 0.2s, box-shadow 0.2s;
            }
            .ticket-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            }
            .ticket-info {
                flex: 1 1 300px;
                margin-right: 20px;
            }
            .ticket-info h4 {
                margin: 0 0 10px;
                color: #0c77ac;
                font-size: 20px;
            }
            .ticket-info p {
                margin: 5px 0;
                font-size: 16px;
                color: #555;
            }
            .ticket-actions {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: flex-end;
            }
            .btn {
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
                font-size: 16px;
                font-weight: bold;
                color: white;
                background-color: #0c77ac;
                border: none;
                cursor: pointer;
                margin-top: 10px;
                transition: background-color 0.2s;
            }
            .btn:hover {
                background-color: #005f8b;
            }
            .no-tickets {
                text-align: center;
                color: #888;
                font-size: 18px;
                margin: 40px 0;
            }
        </style>
    </head>
    <body>
        <header>
            My Tickets
        </header>
        <div class="container">
            <c:if test="${empty tickets}">
                <div class="no-tickets">
                    <p>You have no tickets booked yet.</p>
                </div>
            </c:if>
            <c:forEach var="ticket" items="${tickets}">
                <div class="ticket-card">
                    <div class="ticket-info">
                        <h4>${ticket.namaKereta} (Train No: ${ticket.nomorKereta})</h4>
                        <p><strong>Passenger Name:</strong> ${ticket.namaPenumpang}</p>
                        <p><strong>Route:</strong> ${ticket.stasiunAsal} → ${ticket.stasiunTujuan}</p>
                        <p><strong>Departure:</strong> ${ticket.departureTime} | <strong>Arrival:</strong> ${ticket.arrivalTime}</p>
                        <p><strong>Travel Date:</strong> ${ticket.tanggalKeberangkatan}</p>
                        <p><strong>Price:</strong> Rp ${ticket.harga}</p>
                        <p><strong>Booking Time:</strong> ${ticket.waktuBooking}</p>
                    </div>
                    <div class="ticket-actions">
                        <a class="btn" href="printTicket?ticketId=${ticket.idBooked}">Print Ticket</a>
                        <a class="btn" href="cancelTicket?ticketId=${ticket.idBooked}" style="background-color: #e74c3c;">Cancel Ticket</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
