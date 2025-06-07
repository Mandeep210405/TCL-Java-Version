package com.tcl.servlet;

import com.tcl.dao.UserDAO;
import com.tcl.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet for handling user registration
 */
@MultipartConfig
public class UserRegistrationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Handle POST requests for user registration
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get form data
            String fatherName = request.getParameter("FatherName");
            String motherName = request.getParameter("MotherName");
            String childName = request.getParameter("ChildName");
            String email = request.getParameter("Email");
            String contact = request.getParameter("Contact");
            String address = request.getParameter("Address");
            int height = Integer.parseInt(request.getParameter("Height"));
            int weight = Integer.parseInt(request.getParameter("Weight"));
            String bloodGroup = request.getParameter("BloodGroup");
            String gender = request.getParameter("Gender");
            String birthDateStr = request.getParameter("BirthDate");
            String password = request.getParameter("Password");

            // Parse birth date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date birthDate = dateFormat.parse(birthDateStr);

            // Handle file upload
            Part filePart = request.getPart("BirthCertificate");
            String fileName = getSubmittedFileName(filePart);

            // Generate a unique file name to avoid conflicts
            String uniqueFileName = System.currentTimeMillis() + "_" + fileName;

            // Define the upload directory
            String uploadDir = "Birth-Certificate-Images";
            String applicationPath = request.getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + uploadDir;

            // Create the upload directory if it doesn't exist
            File uploadDirFile = new File(uploadPath);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdirs();
            }

            // Save the file
            String filePath = uploadPath + File.separator + uniqueFileName;
            filePart.write(filePath);

            // Create a User object
            User user = new User();
            user.setFatherName(fatherName);
            user.setMotherName(motherName);
            user.setChildName(childName);
            user.setEmail(email);
            user.setContact(contact);
            user.setAddress(address);
            user.setHeight(height);
            user.setWeight(weight);
            user.setBloodGroup(bloodGroup);
            user.setGender(gender);
            user.setBirthDate(birthDate);
            user.setBirthCertificate(uploadDir + "/" + uniqueFileName);
            user.setPassword(password);

            // Register the user
            UserDAO userDAO = new UserDAO();
            int userId = userDAO.registerUser(user);

            if (userId > 0) {
                // Registration successful
                response.sendRedirect("index.jsp?registrationSuccess=User registered successfully! Your User ID is: " + userId);
            } else {
                // Registration failed
                request.setAttribute("registrationError", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (ParseException e) {
            // Date parsing error
            e.printStackTrace();
            request.setAttribute("registrationError", "Invalid date format: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } catch (Exception e) {
            // Other errors
            e.printStackTrace();
            request.setAttribute("registrationError", "Registration failed: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    /**
     * Get the submitted file name from a Part
     * @param part Part object
     * @return File name
     */
    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
            }
        }
        return null;
    }
}
