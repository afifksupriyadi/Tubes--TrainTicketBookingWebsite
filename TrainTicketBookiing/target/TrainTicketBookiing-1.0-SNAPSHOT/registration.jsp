<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="CSS/css-registration.css">
    </head>
    <body>
         <!-- Header Section -->
    <header>
        <div class="header-container">
            <!-- Logo Section -->
            <div class="header-logo">
                <h1>Kereta Kuy</h1>
            </div>
            
            <!-- Middle Icon Section -->
            <div class="header-middle">
                <img src="Asset/train-navbar.png" alt="Train Logo">
            </div>
            
            <!-- Actions Section -->
            <div class="header-actions">
                <img src="Asset/profile-navbar.png" alt="Profile Icon">
            </div>
        </div>
        <!-- Horizontal Line -->
        <div class="header-line"></div>
    </header>

    <!-- Registration Form Section -->
    <main>
        <div class="form-container">
            <h2>Daftar Akun</h2>
            <form action="insert" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label for="nama">Nama Lengkap</label>
                        <input type="text" id="nama" name="nama" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="tanggal">Tanggal Lahir</label>
                        <input type="date" id="tanggal" name="tanggal" required>
                    </div>
                    <div class="form-group">
                        <label for="gender">Jenis Kelamin</label>
                        <select id="gender" name="gender" required>
                            <option value="laki-laki">Laki-Laki</option>
                            <option value="perempuan">Perempuan</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                     <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                </div>
                <div class="form-submit">
                    <input type="submit" value="Kirim">
                </div>
                <p>Sudah ada akun? <a href="login.jsp">Login</a></p>
            </form>
        </div>
    </main>
    </body>
</html>
