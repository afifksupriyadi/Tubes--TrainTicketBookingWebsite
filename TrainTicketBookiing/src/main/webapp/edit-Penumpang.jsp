<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Penumpang</title>
        <style>
            /* Tambahkan gaya sesuai kebutuhan */
            body {
                font-family: Arial, sans-serif;
                background-color: #f7f7f7;
            }
            .container {
                width: 50%;
                margin: 50px auto;
                background: white;
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #0C77AC;
            }
            form {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }
            label {
                font-weight: bold;
            }
            input {
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ddd;
            }
            button {
                padding: 10px 15px;
                color: white;
                background-color: #0C77AC;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            button:hover {
                background-color: #005f8b;
            }
            a {
                text-decoration: none;
                color: #0C77AC;
                text-align: center;
                display: block;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Edit Penumpang</h1>
            <form action="editPenumpang" method="POST">
                <input type="hidden" name="id" value="${penumpang.idPenumpang}">
                <label for="namaPenumpang">Nama Penumpang:</label>
                <input type="text" id="namaPenumpang" name="namaPenumpang" value="${penumpang.namaPenumpang}" required>
                <label for="emailPenumpang">Email Penumpang:</label>
                <input type="email" id="emailPenumpang" name="emailPenumpang" value="${penumpang.emailPenumpang}" required>
                <button type="submit">Update</button>
                <a href="showPenumpang?id=${user.idUser}">Cancel</a>
            </form>
        </div>
    </body>
</html>
