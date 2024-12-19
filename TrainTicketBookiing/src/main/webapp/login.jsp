<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="CSS/css-login.css">
    </head>
    <body>
        <div class="page-wrapper">
            <div class="outer-container">
                <!-- Welcome Section -->
                <div class="welcome-section">
                    <h1>Selamat Datang di <br> Website Pemesanan Tiket Kereta</h1>
                    <img src="Asset/homepage.png" alt="Welcome Image">
                </div>

                <!-- Login Form Section -->
                <div class="login-section">
                    <div class="login-box">
                        <h2>Masuk</h2>
                        <!-- Error Message -->
                        <%
                            String error = request.getParameter("error");
                            if (error != null && error.equals("invalid")) {
                        %>
                        <p style="color: red; text-align: center; margin-bottom: 15px;">
                            Invalid username or password. Please try again.
                        </p>
                        <% }%>
                        <form action="login" method="post">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" id="username" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="password" required>
                            </div>
                            <div class="form-submit">
                                <input type="submit" value="Log In">
                            </div>
                        </form>
                        <p>Belum ada akun? <a href="registration.jsp">Daftar segera</a></p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
