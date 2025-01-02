<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Success</title>
        <style>
            body {
                font-family: 'Trebuchet MS', Arial, sans-serif;
                text-align: center;
                background-color: #f7f7f7;
                margin: 0;
                padding: 0;
            }
            .container {
                margin-top: 100px;
            }
            h1 {
                color: #4CAF50; /* Success green color */
                font-size: 36px;
            }
            p {
                font-size: 18px;
                color: #555;
            }
            .btn-view-tickets, .btn-back-home {
                display: inline-block;
                margin: 10px 10px;
                padding: 10px 20px;
                background-color: #0C77AC;
                color: white;
                text-decoration: none;
                font-weight: bold;
                border-radius: 5px;
                transition: background-color 0.3s;
            }
            .btn-view-tickets:hover, .btn-back-home:hover {
                background-color: #005f8b;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Booking Successful!</h1>
            <p>Your tickets have been successfully booked. Thank you for choosing our service.</p>
            <a href="myticket" class="btn-view-tickets">View My Tickets</a>
            <a href="homepage" class="btn-back-home">Back to Homepage</a>
        </div>
    </body>
</html>