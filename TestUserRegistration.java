import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

public class TestUserRegistration {
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
                
                // Check if the userregistration table exists
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SHOW TABLES LIKE 'userregistration'");
                
                if (rs.next()) {
                    System.out.println("userregistration table exists!");
                    
                    // Check the structure of the userregistration table
                    rs = stmt.executeQuery("DESCRIBE userregistration");
                    System.out.println("Table structure:");
                    while (rs.next()) {
                        System.out.println(rs.getString("Field") + " - " + rs.getString("Type") + " - " + rs.getString("Null"));
                    }
                    
                    // Try to insert a test user
                    Random rand = new Random();
                    int tmpId = 100000 + rand.nextInt(900000);
                    
                    String insertQuery = "INSERT INTO userregistration (TmpId, FatherName, MotherName, ChildName, Email, Contact, Address, Height, Weight, BloodGroup, Gender, BirthDate, BirthCertificate, Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement pstmt = connection.prepareStatement(insertQuery);
                    
                    pstmt.setInt(1, tmpId);
                    pstmt.setString(2, "Test Father");
                    pstmt.setString(3, "Test Mother");
                    pstmt.setString(4, "Test Child");
                    pstmt.setString(5, "test@example.com");
                    pstmt.setString(6, "1234567890");
                    pstmt.setString(7, "Test Address");
                    pstmt.setInt(8, 50);
                    pstmt.setInt(9, 3);
                    pstmt.setString(10, "A+");
                    pstmt.setString(11, "Male");
                    pstmt.setString(12, "2023-01-01");
                    pstmt.setString(13, "Test-Certificate.jpg");
                    pstmt.setString(14, "testpassword");
                    
                    int rowsAffected = pstmt.executeUpdate();
                    System.out.println("Rows affected: " + rowsAffected);
                    
                    if (rowsAffected > 0) {
                        System.out.println("Test user inserted successfully!");
                        
                        // Clean up the test data
                        pstmt = connection.prepareStatement("DELETE FROM userregistration WHERE Email = ?");
                        pstmt.setString(1, "test@example.com");
                        pstmt.executeUpdate();
                        System.out.println("Test user deleted.");
                    } else {
                        System.out.println("Failed to insert test user.");
                    }
                } else {
                    System.out.println("userregistration table does not exist!");
                }
                
                connection.close();
            }
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
