<%-- 
    Document   : profile
    Created on : Jan 3, 2025, 11:24:44 AM
    Author     : Aydin Shidqi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Profile</title>
        <link rel="stylesheet" href="CSS/css-profile.css">
    </head>
    <body>
        <header>
            <div class="header-logo">
                <img src="Asset/train-navbar.png" alt="Train Logo">
                <h1>Kereta Kuy</h1>
            </div>
            <div class="header-actions">
                <a href="homepage">Kembali</a>
            </div>
        </header>
        <div class="header-line"></div>
        <div class="outer-container">
            <div class="main-container">
                <h1 class="form-title">User Profile</h1>
                <c:choose>
                    <c:when test="${not empty user}">
                        <div class="ticket-container">
                            <h2>Informasi Pengguna</h2>
                            <p><strong>Nama:</strong> ${user.nama}</p>
                            <p><strong>Email:</strong> ${user.email}</p>
                            <p><strong>Gender:</strong> ${user.gender}</p>
                            <p><strong>Tanggal Lahir:</strong> ${user.tanggalLahir}</p>
                            <p><strong>Username:</strong> ${user.username}</p>
                        </div>

                        <hr>

                        <div class="ticket-container">
                            <h2>Edit User</h2>
                            <form action="edit" method="post" class="edit-form">
                                <input type="hidden" name="idUser" value="${user.idUser}">
                                <label for="nama">Nama:</label>
                                <input type="text" id="nama" name="nama" value="${user.nama}" required><br><br>

                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" value="${user.email}" required><br><br>

                                <label for="gender">Gender:</label>
                                <select id="gender" name="gender" required>
                                    <option value="Laki-laki" ${user.gender == 'Laki-laki' ? 'selected' : ''}>Laki-laki</option>
                                    <option value="Perempuan" ${user.gender == 'Perempuan' ? 'selected' : ''}>Perempuan</option>
                                </select><br><br>

                                <label for="tanggalLahir">Tanggal Lahir:</label>
                                <input type="date" id="tanggalLahir" name="tanggalLahir" value="${user.tanggalLahir}" required><br><br>

                                <label for="username">Username:</label>
                                <input type="text" id="username" name="username" value="${user.username}" required><br><br>

                                <label for="passwrd">Password:</label>
                                <input type="password" id="passwrd" name="passwrd" value="${user.password}" required><br><br>

                                <button type="submit" class="btn-submit">Update</button>
                            </form>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="ticket-container">
                            <p>User data not available.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </body>
</html>
