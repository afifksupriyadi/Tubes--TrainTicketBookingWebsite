import dao.LoginDAO;
import model.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import static org.junit.jupiter.api.Assertions.*;

public class LoginDAOTest {

    private LoginDAO loginDAO;

    @BeforeEach
    public void setUp() throws Exception {
        String url = "jdbc:mysql://localhost:3306/test_keretakuy";
        String user = "root";
        String password = "";

        // Setup database
        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement()) {

            // Create user table if it doesn't exist
            stmt.execute("CREATE TABLE IF NOT EXISTS user (" +
                    "idUser INT AUTO_INCREMENT PRIMARY KEY, " +
                    "nama VARCHAR(50), " +
                    "email VARCHAR(30), " +
                    "gender ENUM('Laki-laki', 'Perempuan'), " +
                    "tanggalLahir DATE, " +
                    "username VARCHAR(20) UNIQUE, " +
                    "passwrd VARCHAR(20))");

            // Insert dummy data
            stmt.execute("INSERT INTO user (nama, email, gender, tanggalLahir, username, passwrd) " +
                    "VALUES " +
                    "('John Doe', 'johndoe@gmail.com', 'Laki-laki', '1990-01-01', 'johndoe', 'password123') " +
                    "ON DUPLICATE KEY UPDATE username=username");
        }

        // Initialize LoginDAO
        loginDAO = new LoginDAO();
    }

    @Test
    public void testValidUserLogin() {
        User user = new User();
        user.setUsername("johndoe");
        user.setPassword("password123");

        User result = loginDAO.getUserIfValid(user);
        assertNotNull(result, "Login harus berhasil untuk kredensial yang valid");
    }

    @Test
    public void testInvalidUserLogin() {
        User user = new User();
        user.setUsername("wronguser");
        user.setPassword("wrongpassword");

        User result = loginDAO.getUserIfValid(user);
        assertNull(result, "Login harus gagal untuk kredensial yang tidak valid");
    }
}
