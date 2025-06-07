package com.tcl.servlet;

import com.tcl.dao.UserDAOImpl;
import com.tcl.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet for handling user login
 */
public class UserLoginServletImpl extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * Handle POST requests for user login
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get form data
            int userId = Integer.parseInt(request.getParameter("UserID"));
            String password = request.getParameter("Password");
            
            // Authenticate user
            UserDAOImpl userDAO = new UserDAOImpl();
            User user = userDAO.authenticate(userId, password);
            
            if (user != null) {
                // Login successful
                HttpSession session = request.getSession();
                session.setAttribute("UserID", user.getUserId());
                session.setAttribute("UserName", user.getChildName());
                
                // Redirect to user page
                response.sendRedirect("userpage.jsp");
            } else {
                // Login failed
                request.setAttribute("loginError", "Invalid user ID or password.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            // Invalid user ID format
            request.setAttribute("loginError", "Invalid user ID format.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            // Other errors
            e.printStackTrace();
            request.setAttribute("loginError", "Login failed: " + e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
