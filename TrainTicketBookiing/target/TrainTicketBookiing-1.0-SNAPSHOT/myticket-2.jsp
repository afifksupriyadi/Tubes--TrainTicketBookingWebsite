<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Tickets</title>
    <style>
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
</head>
<body>
    <div class="container">
        <h1>My Tickets</h1>
        <c:if test="${not empty tickets}">
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Passenger Name</th>
                        <th>Train</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Departure</th>
                        <th>Arrival</th>
                        <th>Booking Date</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ticket" items="${tickets}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${ticket.namaPenumpang}</td>
                            <td>${ticket.namaKereta}</td>
                            <td>${ticket.stasiunAsal}</td>
                            <td>${ticket.stasiunTujuan}</td>
                            <td>${ticket.departureTime}</td>
                            <td>${ticket.arrivalTime}</td>
                            <td>${ticket.waktuBooking}</td>
                            <td>Rp ${ticket.harga}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty tickets}">
            <p style="text-align:center;">You have no tickets booked yet.</p>
        </c:if>
        <div class="footer">
            <a href="homepage.jsp">Back to Homepage</a>
        </div>
    </div>
</body>
</html>
