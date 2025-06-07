<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tcl.dao.UserDAO" %>
<%@ page import="com.tcl.dao.VaccineRecordDAO" %>
<%@ page import="com.tcl.model.User" %>
<%@ page import="com.tcl.model.VaccineRecord" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    // Check if user is logged in
    Integer userIdObj = (Integer) session.getAttribute("UserID");
    if (userIdObj == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    
    int userId = userIdObj.intValue();
    
    // Get user information
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserById(userId);
    
    if (user == null) {
        session.invalidate();
        response.sendRedirect("index.jsp");
        return;
    }
    
    // Calculate age
    Calendar today = Calendar.getInstance();
    Calendar birthDate = Calendar.getInstance();
    birthDate.setTime(user.getBirthDate());
    
    int age = today.get(Calendar.YEAR) - birthDate.get(Calendar.YEAR);
    if (today.get(Calendar.DAY_OF_YEAR) < birthDate.get(Calendar.DAY_OF_YEAR)) {
        age--;
    }
    
    // Get vaccine records
    VaccineRecordDAO vaccineRecordDAO = new VaccineRecordDAO();
    List<VaccineRecord> vaccineRecords = vaccineRecordDAO.getVaccineRecordsByUserId(userId);
    
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TCL - TRUE LIFE CARE</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2B6CB0;
            --secondary-color: #4299E1;
            --accent-color: #63B3ED;
            --text-color: #2D3748;
            --light-bg: #EBF8FF;
            --white: #FFFFFF;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, var(--light-bg) 0%, var(--white) 100%);
            min-height: 100vh;
            color: var(--text-color);
            padding-top: 60px;
        }

        .navbar {
            background: var(--white) !important;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 0.5rem 1rem;
            height: 60px;
        }

        .navbar-brand {
            color: var(--primary-color) !important;
            font-weight: 600;
            font-size: 1.3rem;
            padding: 0.5rem 0;
        }

        .nav-link {
            color: var(--text-color) !important;
            font-weight: 500;
            transition: all 0.3s ease;
            padding: 0.5rem 1rem !important;
        }

        .nav-link:hover, .nav-link.active {
            color: var(--primary-color) !important;
        }

        .navbar-toggler {
            padding: 0.25rem 0.5rem;
            font-size: 1rem;
        }

        .card {
            background: var(--white);
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            margin-bottom: 20px;
        }

        .user-info-section {
            padding: 20px;
        }

        .user-info-section label {
            display: block;
            margin-bottom: 10px;
            font-weight: 500;
        }

        .vaccine-records {
            background: var(--white);
            border-radius: 15px;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        .vaccine-records h3 {
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .vaccine-record-item {
            border-bottom: 1px solid var(--light-bg);
            padding: 10px 0;
        }

        .vaccine-record-item:last-child {
            border-bottom: none;
        }
        
        .logout-btn {
            color: #dc3545;
            text-decoration: none;
            font-weight: 500;
        }
        
        .logout-btn:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <i class="fas fa-heartbeat me-2"></i>TCL
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="logout-btn nav-link" href="logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="user-info-section">
                                    <h3>Personal Information</h3>
                                    <label>Child Name: <%= user.getChildName() %></label>
                                    <label>Father Name: <%= user.getFatherName() %></label>
                                    <label>Mother Name: <%= user.getMotherName() %></label>
                                    <label>Birth Date: <%= dateFormat.format(user.getBirthDate()) %></label>
                                    <label>Email: <%= user.getEmail() %></label>
                                    <label>Mobile Number: <%= user.getContact() %></label>
                                    <label>Address: <%= user.getAddress() %></label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="user-info-section">
                                    <h3>Medical Information</h3>
                                    <label>Age: <%= age %></label>
                                    <label>Height: <%= user.getHeight() %> cm</label>
                                    <label>Weight: <%= user.getWeight() %> kg</label>
                                    <label>Blood Group: <%= user.getBloodGroup() %></label>
                                    <label>Gender: <%= user.getGender() %></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="vaccine-records">
                    <h3>Vaccine Records</h3>
                    <div id="vaccineRecords">
                        <% if(vaccineRecords != null && !vaccineRecords.isEmpty()) { %>
                            <% for(VaccineRecord record : vaccineRecords) { %>
                                <div class="vaccine-record-item">
                                    <strong><%= record.getVaccineName() %></strong> - 
                                    Dose: <%= record.getVaccineDose() %> - 
                                    Date: <%= dateFormat.format(record.getVaccineDate()) %>
                                </div>
                            <% } %>
                        <% } else { %>
                            <p>No vaccine records found.</p>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
