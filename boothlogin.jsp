<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TCL - Booth Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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
            background: var(--white);
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
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
        }

        .card-body {
            padding: 2rem;
        }

        .login-title {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 2rem;
            text-align: center;
        }

        .form-control {
            background: var(--light-bg);
            border: 2px solid transparent;
            border-radius: 10px;
            padding: 12px 15px;
            margin-bottom: 1rem;
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
            width: 100%;
            margin-top: 1rem;
        }

        .btn-primary:hover {
            background: var(--secondary-color);
        }

        .alert {
            border-radius: 10px;
            margin-bottom: 1rem;
        }

        .container {
            max-width: 1200px;
            padding: 2rem;
        }

        .row {
            margin: 0 -15px;
        }

        .col-md-5 {
            padding: 0 15px;
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
                        <a class="nav-link" href="index.jsp">User Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <div class="row justify-content-center">
            <!-- Login Form -->
            <div class="col-md-5 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center login-title">Booth Login</h3>
                        <% if(request.getAttribute("loginError") != null) { %>
                            <div class="alert alert-danger"><%= request.getAttribute("loginError") %></div>
                        <% } %>
                        <% if(request.getParameter("registrationSuccess") != null) { %>
                            <div class="alert alert-success"><%= request.getParameter("registrationSuccess") %></div>
                        <% } %>
                        <form method="POST" action="boothLogin">
                            <div class="mb-3">
                                <label class="form-label">Booth ID</label>
                                <input type="number" class="form-control" name="UserID" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control" name="Password" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Login</button>
                        </form>
                    </div>
                </div>
            </div>
            
            <!-- Registration Form -->
            <div class="col-md-5 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center login-title">Booth Registration</h3>
                        <% if(request.getAttribute("registrationError") != null) { %>
                            <div class="alert alert-danger"><%= request.getAttribute("registrationError") %></div>
                        <% } %>
                        <form method="POST" action="boothRegister" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label class="form-label">Booth Name</label>
                                <input type="text" class="form-control" name="BoothName" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Owner Name</label>
                                <input type="text" class="form-control" name="OwnerName" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Contact Number</label>
                                <input type="text" class="form-control" name="Contact" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" name="Email" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <textarea class="form-control" name="Address" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Aadhar Card</label>
                                <input type="file" class="form-control" name="AdharCard" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control" name="Password" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Register</button>
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
