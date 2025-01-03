import dao.RegisterDAO;
import model.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import static org.junit.jupiter.api.Assertions.*;

public class RegisterDAOTest {

    private RegisterDAO registerDAO;

    @BeforeEach
    public void setUp() throws Exception {
        String url = "jdbc:mysql://localhost:3306/test_keretakuy";
        String user = "root";
        String password = "";

        // Setup database
        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement()) {
            stmt.execute("CREATE TABLE IF NOT EXISTS user (" +
                    "idUser INT AUTO_INCREMENT PRIMARY KEY, " +
                    "nama VARCHAR(50), " +
                    "email VARCHAR(30), " +
                    "gender ENUM('Laki-laki', 'Perempuan'), " +
                    "tanggalLahir DATE, " +
                    "username VARCHAR(20) UNIQUE, " +
                    "passwrd VARCHAR(20))");
            
            stmt.execute("INSERT INTO user (nama, email, gender, tanggalLahir, username, passwrd) " +
                    "VALUES " +
                    "('John Doe', 'johndoe@gmail.com', 'Laki-laki', '1990-01-01', 'johndoe', 'password123')");
        }

        // Initialize RegisterDAO
        registerDAO = new RegisterDAO();
    }

    

    @Test
    public void testRegisterUser() {
        User newUser = new User("Jane Doe", "janedoe@gmail.com", "Perempuan", "1995-05-05", "janedoe", "password456");
        boolean result = registerDAO.registerUser(newUser);
        assertTrue(result, "User harus berhasil didaftarkan");
    }

   
}
