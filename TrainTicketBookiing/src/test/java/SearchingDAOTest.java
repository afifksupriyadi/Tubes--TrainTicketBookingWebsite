import dao.SearchingDAO;
import model.ListKereta;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

public class SearchingDAOTest {
    private SearchingDAO searchingDAO;
    @BeforeEach
    public void setUp() throws Exception {
        // Initialize SearchingDAO
        searchingDAO = new SearchingDAO();
    }
    @Test
    public void testSearchKeretaValid() {
        // Test with valid parameters
        List<ListKereta> results = searchingDAO.searchKereta("Bandung", "Banjar", "2025-01-06", 1);
        assertNotNull(results, "Results should not be null");
        assertFalse(results.isEmpty(), "Results should not be empty");

        // Verify the first result
        ListKereta train = results.get(0);
        assertEquals("Argo Wilis", train.getNamaKereta(), "Train name should match");
        assertEquals(310, train.getTotalDistance(), "Total distance should match");
    }
    @Test
    public void testSearchKeretaInvalid() {
        // Test with invalid parameters
        List<ListKereta> results = searchingDAO.searchKereta("Bandung", "UnknownStation", "2025-01-06", 1);
        assertNotNull(results, "Results should not be null");
        assertTrue(results.isEmpty(), "Results should be empty for invalid search");
    }
}
