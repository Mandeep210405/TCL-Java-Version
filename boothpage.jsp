<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tcl.dao.BoothDAO" %>
<%@ page import="com.tcl.dao.UserDAO" %>
<%@ page import="com.tcl.dao.VaccineRecordDAO" %>
<%@ page import="com.tcl.model.Booth" %>
<%@ page import="com.tcl.model.User" %>
<%@ page import="com.tcl.model.VaccineRecord" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    // Check if booth is logged in
    Integer boothIdObj = (Integer) session.getAttribute("BoothID");
    if (boothIdObj == null) {
        response.sendRedirect("boothlogin.jsp");
        return;
    }
    
    int boothId = boothIdObj.intValue();
    
    // Get booth information
    BoothDAO boothDAO = new BoothDAO();
    Booth booth = boothDAO.getBoothById(boothId);
    
    if (booth == null) {
        session.invalidate();
        response.sendRedirect("boothlogin.jsp");
        return;
    }
    
    // Handle form submission for adding vaccine record
    String message = null;
    if (request.getMethod().equalsIgnoreCase("POST")) {
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String vaccineName = request.getParameter("vaccineName");
            int vaccineDose = Integer.parseInt(request.getParameter("vaccineDose"));
            
            // Parse date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date vaccineDate = dateFormat.parse(request.getParameter("vaccineDate"));
            
            // Create and save vaccine record
            VaccineRecord record = new VaccineRecord();
            record.setUserId(userId);
            record.setVaccineName(vaccineName);
            record.setVaccineDose(vaccineDose);
            record.setVaccineDate(vaccineDate);
            
            VaccineRecordDAO vaccineRecordDAO = new VaccineRecordDAO();
            boolean success = vaccineRecordDAO.addVaccineRecord(record);
            
            if (success) {
                message = "Vaccine record added successfully!";
            } else {
                message = "Failed to add vaccine record. Please try again.";
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TCL - Booth Dashboard</title>
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

        .booth-info-section {
            padding: 20px;
        }

        .booth-info-section label {
            display: block;
            margin-bottom: 10px;
            font-weight: 500;
        }

        .form-control {
            background: var(--light-bg);
            border: 2px solid transparent;
            border-radius: 10px;
            padding: 12px 15px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            background: var(--white);
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(99, 179, 237, 0.2);
        }

        .btn-primary {
            background: var(--primary-color);
            border: none;
            padding: 12px 25px;
            border-radius: 10px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
        }
        
        .logout-btn {
            color: #dc3545;
            text-decoration: none;
            font-weight: 500;
        }
        
        .logout-btn:hover {
            text-decoration: underline;
        }
        
        .section-title {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 1.5rem;
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
                        <div class="booth-info-section">
                            <h3 class="section-title">Booth Information</h3>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Booth Name: <%= booth.getBoothName() %></label>
                                    <label>Owner Name: <%= booth.getOwnerName() %></label>
                                    <label>Contact: <%= booth.getContact() %></label>
                                </div>
                                <div class="col-md-6">
                                    <label>Email: <%= booth.getEmail() %></label>
                                    <label>Address: <%= booth.getAddress() %></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h3 class="section-title">Add Vaccine Record</h3>
                        <% if(message != null) { %>
                            <div class="alert <%= message.startsWith("Error") || message.startsWith("Failed") ? "alert-danger" : "alert-success" %>">
                                <%= message %>
                            </div>
                        <% } %>
                        <form method="POST" action="boothpage.jsp">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">User ID</label>
                                        <input type="number" class="form-control" name="userId" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Vaccine Name</label>
                                        <select class="form-select" name="vaccineName" required>
                                            <option value="BCG">BCG</option>
                                            <option value="OPV">OPV</option>
                                            <option value="DPT">DPT</option>
                                            <option value="Hepatitis B">Hepatitis B</option>
                                            <option value="MMR">MMR</option>
                                            <option value="TT">TT</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Vaccine Dose</label>
                                        <input type="number" class="form-control" name="vaccineDose" min="1" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Vaccine Date</label>
                                        <input type="date" class="form-control" name="vaccineDate" required>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Record</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
