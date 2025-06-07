package com.tcl.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet for testing file upload directory
 */
public class TestFileUploadServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    /**
     * Handle GET requests for testing
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("<html><head><title>File Upload Test</title></head><body>");
        out.println("<h1>File Upload Directory Test</h1>");
        
        try {
            // Define the upload directory
            String uploadDir = "Birth-Certificate-Images";
            String applicationPath = request.getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + uploadDir;
            
            out.println("<p>Application Path: " + applicationPath + "</p>");
            out.println("<p>Upload Path: " + uploadPath + "</p>");
            
            // Check if the directory exists
            File uploadDirFile = new File(uploadPath);
            if (uploadDirFile.exists()) {
                out.println("<p style='color:green'>Upload directory exists!</p>");
                
                // Check if the directory is writable
                if (uploadDirFile.canWrite()) {
                    out.println("<p style='color:green'>Upload directory is writable!</p>");
                } else {
                    out.println("<p style='color:red'>Upload directory is not writable!</p>");
                }
                
                // Try to create a test file
                File testFile = new File(uploadPath + File.separator + "test.txt");
                try {
                    if (testFile.createNewFile()) {
                        out.println("<p style='color:green'>Successfully created test file!</p>");
                        
                        // Clean up the test file
                        if (testFile.delete()) {
                            out.println("<p style='color:green'>Successfully deleted test file!</p>");
                        } else {
                            out.println("<p style='color:red'>Failed to delete test file!</p>");
                        }
                    } else {
                        out.println("<p style='color:red'>Failed to create test file!</p>");
                    }
                } catch (IOException e) {
                    out.println("<p style='color:red'>Error creating test file: " + e.getMessage() + "</p>");
                }
            } else {
                out.println("<p style='color:red'>Upload directory does not exist!</p>");
                
                // Try to create the directory
                if (uploadDirFile.mkdirs()) {
                    out.println("<p style='color:green'>Successfully created upload directory!</p>");
                } else {
                    out.println("<p style='color:red'>Failed to create upload directory!</p>");
                }
            }
            
            // List all files in the directory
            if (uploadDirFile.exists()) {
                File[] files = uploadDirFile.listFiles();
                if (files != null && files.length > 0) {
                    out.println("<h2>Files in Upload Directory:</h2>");
                    out.println("<ul>");
                    for (File file : files) {
                        out.println("<li>" + file.getName() + " (" + file.length() + " bytes)</li>");
                    }
                    out.println("</ul>");
                } else {
                    out.println("<p>No files in upload directory.</p>");
                }
            }
            
        } catch (Exception e) {
            out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
            e.printStackTrace(out);
        }
        
        out.println("</body></html>");
    }
}
