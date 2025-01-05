<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Daftar Penumpang</title>
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
                justify-content: center;
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
            <h1>Daftar Penumpang dari ${user.nama}</h1>
            <c:if test="${not empty penumpangList}">
                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nama Penumpang</th>
                            <th>Email Penumpang</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="penumpang" items="${penumpangList}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${penumpang.namaPenumpang}</td>
                                <td>${penumpang.emailPenumpang}</td>
                                <td><a href="showEditPenumpang?id=${penumpang.idPenumpang}">Edit</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty penumpangList}">
                <p style="text-align:center;">Tidak ada penumpang yang terdaftar.</p>
            </c:if>
            <div class="footer">
                <a href="homepage">Kembali ke Homepage</a>
            </div>
        </div>
    </body>
</html>
