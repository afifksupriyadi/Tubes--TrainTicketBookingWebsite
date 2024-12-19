<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Success</title>
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
                color: #0C77AC;
                font-size: 36px;
            }
            p {
                font-size: 18px;
                color: #555;
            }
            a {
                display: inline-block;
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #0C77AC;
                color: white;
                text-decoration: none;
                font-weight: bold;
                border-radius: 5px;
            }
            a:hover {
                background-color: #005f8b;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Registration Successful!</h1>
            <p>Thank you for registering. You can now log in to your account.</p>
            <a href="login.jsp">Go to Login Page</a>
        </div>
    </body>
</html>
