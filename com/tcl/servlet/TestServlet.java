package com.tcl.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet for testing database connection
 */
public class TestServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * Handle GET requests for testing
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("<html><head><title>Database Test</title></head><body>");
        out.println("<h1>Database Connection Test</h1>");
        
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            out.println("<p>MySQL JDBC Driver loaded successfully!</p>");
            
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/user";
            String username = "root";
            String password = "";
            
            // Attempt to establish a connection
            Connection connection = DriverManager.getConnection(url, username, password);
            out.println("<p>Database connection successful!</p>");
            
            // Test query
            PreparedStatement pstmt = connection.prepareStatement("SELECT * FROM userregistration");
            ResultSet rs = pstmt.executeQuery();
            
            out.println("<h2>Users in Database:</h2>");
            out.println("<table border='1'>");
            out.println("<tr><th>User ID</th><th>Child Name</th><th>Email</th></tr>");
            
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("UserId") + "</td>");
                out.println("<td>" + rs.getString("ChildName") + "</td>");
                out.println("<td>" + rs.getString("Email") + "</td>");
                out.println("</tr>");
            }
            
            out.println("</table>");
            
            // Test authentication
            out.println("<h2>Authentication Test:</h2>");
            
            int userId = 1; // Use an existing user ID
            String userPassword = "11"; // Use the correct password for that user
            
            pstmt = connection.prepareStatement("SELECT * FROM userregistration WHERE UserId = ? AND Password = ?");
            pstmt.setInt(1, userId);
            pstmt.setString(2, userPassword);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                out.println("<p style='color:green'>Authentication successful for user ID " + userId + "!</p>");
            } else {
                out.println("<p style='color:red'>Authentication failed for user ID " + userId + "!</p>");
            }
            
            // Close resources
            rs.close();
            pstmt.close();
            connection.close();
            
        } catch (ClassNotFoundException e) {
            out.println("<p style='color:red'>MySQL JDBC Driver not found: " + e.getMessage() + "</p>");
            e.printStackTrace(out);
        } catch (SQLException e) {
            out.println("<p style='color:red'>Database error: " + e.getMessage() + "</p>");
            e.printStackTrace(out);
        } catch (Exception e) {
            out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
            e.printStackTrace(out);
        }
        
        out.println("</body></html>");
    }
}
