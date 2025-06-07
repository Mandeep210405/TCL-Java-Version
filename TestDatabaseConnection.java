import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestDatabaseConnection {
    public static void main(String[] args) {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/user";
            String username = "root";
            String password = "";
            
            // Attempt to establish a connection
            Connection connection = DriverManager.getConnection(url, username, password);
            
            if (connection != null) {
                System.out.println("Database connection successful!");
                connection.close();
            }
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Database connection failed: " + e.getMessage());
        }
    }
}
