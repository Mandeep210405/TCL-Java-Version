package com.tcl.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Utility class for database operations
 */
public class DatabaseUtil {
    
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/user";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";
    
    /**
     * Get a database connection
     * @return Connection object
     * @throws ClassNotFoundException if the driver is not found
     * @throws SQLException if a database access error occurs
     */
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(DRIVER);
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
    
    /**
     * Close a database connection
     * @param connection Connection to close
     */
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
