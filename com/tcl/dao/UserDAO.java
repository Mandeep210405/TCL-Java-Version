package com.tcl.dao;

import com.tcl.model.User;
import com.tcl.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Random;

/**
 * Data Access Object for User operations
 */
public class UserDAO {

    /**
     * Get a user by ID
     * @param userId User ID
     * @return User object if found, null otherwise
     */
    public User getUserById(int userId) {
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = null;

        try {
            connection = DatabaseUtil.getConnection();
            String sql = "SELECT * FROM userregistration WHERE UserId = ?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("UserId"));
                user.setTmpId(rs.getInt("TmpId"));
                user.setFatherName(rs.getString("FatherName"));
                user.setMotherName(rs.getString("MotherName"));
                user.setChildName(rs.getString("ChildName"));
                user.setEmail(rs.getString("Email"));
                user.setContact(rs.getString("Contact"));
                user.setAddress(rs.getString("Address"));
                user.setHeight(rs.getInt("Height"));
                user.setWeight(rs.getInt("Weight"));
                user.setBloodGroup(rs.getString("BloodGroup"));
                user.setGender(rs.getString("Gender"));
                user.setBirthDate(rs.getDate("BirthDate"));
                user.setBirthCertificate(rs.getString("BirthCertificate"));
                user.setPassword(rs.getString("Password"));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                DatabaseUtil.closeConnection(connection);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return user;
    }

    /**
     * Register a new user
     * @param user User object with registration details
     * @return User ID if registration successful, -1 otherwise
     */
    public int registerUser(User user) {
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet generatedKeys = null;
        int userId = -1;

        try {
            connection = DatabaseUtil.getConnection();

            // Generate a random temporary ID
            Random rand = new Random();
            int tmpId = 100000 + rand.nextInt(900000);
            user.setTmpId(tmpId);

            String sql = "INSERT INTO userregistration (TmpId, FatherName, MotherName, ChildName, Email, Contact, Address, Height, Weight, BloodGroup, Gender, BirthDate, BirthCertificate, Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            pstmt.setInt(1, user.getTmpId());
            pstmt.setString(2, user.getFatherName());
            pstmt.setString(3, user.getMotherName());
            pstmt.setString(4, user.getChildName());
            pstmt.setString(5, user.getEmail());
            pstmt.setString(6, user.getContact());
            pstmt.setString(7, user.getAddress());
            pstmt.setInt(8, user.getHeight());
            pstmt.setInt(9, user.getWeight());
            pstmt.setString(10, user.getBloodGroup());
            pstmt.setString(11, user.getGender());
            pstmt.setDate(12, new java.sql.Date(user.getBirthDate().getTime()));
            pstmt.setString(13, user.getBirthCertificate());
            pstmt.setString(14, user.getPassword());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // Get the generated user ID
                generatedKeys = pstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    userId = generatedKeys.getInt(1);
                    user.setUserId(userId);
                }

                // If we couldn't get the generated ID, use the temporary ID
                if (userId == -1) {
                    // Get the user ID using the temporary ID
                    PreparedStatement pstmtSelect = connection.prepareStatement("SELECT UserId FROM userregistration WHERE TmpId = ?");
                    pstmtSelect.setInt(1, user.getTmpId());
                    ResultSet rs = pstmtSelect.executeQuery();
                    if (rs.next()) {
                        userId = rs.getInt("UserId");
                        user.setUserId(userId);
                    }
                    rs.close();
                    pstmtSelect.close();
                }
            }
        } catch (ClassNotFoundException e) {
            System.err.println("Database driver not found: " + e.getMessage());
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("SQL error during user registration: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (generatedKeys != null) generatedKeys.close();
                if (pstmt != null) pstmt.close();
                DatabaseUtil.closeConnection(connection);
            } catch (SQLException e) {
                System.err.println("Error closing database resources: " + e.getMessage());
                e.printStackTrace();
            }
        }

        return userId;
    }

    /**
     * Authenticate a user
     * @param userId User ID
     * @param password Password
     * @return User object if authentication successful, null otherwise
     */
    public User authenticateUser(int userId, String password) {
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = null;

        try {
            connection = DatabaseUtil.getConnection();
            String sql = "SELECT * FROM userregistration WHERE UserId = ? AND Password = ?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("UserId"));
                user.setTmpId(rs.getInt("TmpId"));
                user.setFatherName(rs.getString("FatherName"));
                user.setMotherName(rs.getString("MotherName"));
                user.setChildName(rs.getString("ChildName"));
                user.setEmail(rs.getString("Email"));
                user.setContact(rs.getString("Contact"));
                user.setAddress(rs.getString("Address"));
                user.setHeight(rs.getInt("Height"));
                user.setWeight(rs.getInt("Weight"));
                user.setBloodGroup(rs.getString("BloodGroup"));
                user.setGender(rs.getString("Gender"));
                user.setBirthDate(rs.getDate("BirthDate"));
                user.setBirthCertificate(rs.getString("BirthCertificate"));
                user.setPassword(rs.getString("Password"));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                DatabaseUtil.closeConnection(connection);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return user;
    }

    /**
     * Authenticate a user (alternative method name for compatibility)
     * @param userId User ID
     * @param password Password
     * @return User object if authentication successful, null otherwise
     */
    public User authenticate(int userId, String password) {
        // This method is called by UserLoginServlet
        return authenticateUser(userId, password);
    }
}
