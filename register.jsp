<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TCL - User Registration</title>
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

        .form-container {
            background: var(--white);
            border-radius: 15px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 2rem;
            margin: 2rem auto;
            max-width: 800px;
        }

        .form-control {
            background: var(--light-bg);
            border: 2px solid transparent;
            border-radius: 10px;
            padding: 12px 15px;
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
        }

        .btn-primary:hover {
            background: var(--secondary-color);
        }

        .section-title {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 500;
            color: var(--text-color);
        }

        .login-link {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .login-link:hover {
            color: var(--secondary-color);
        }

        .card-body {
            padding: 2.5rem;
        }

        .container {
            padding-top: 6rem;
        }

        .form-section {
            margin-bottom: 2rem;
        }

        .form-section h5 {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--light-bg);
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
                    <li class="nav-item">
                        <a class="nav-link" href="boothlogin.jsp">Booth Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <div class="form-container">
            <h2 class="section-title text-center">User Registration</h2>
            <% if(request.getAttribute("registrationError") != null) { %>
                <div class="alert alert-danger"><%= request.getAttribute("registrationError") %></div>
            <% } %>
            <form method="POST" action="userRegister" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-section">
                            <h5>Personal Information</h5>
                            <div class="mb-3">
                                <label class="form-label">Mother's Name</label>
                                <input type="text" class="form-control" name="MotherName" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Father's Name</label>
                                <input type="text" class="form-control" name="FatherName" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Child's Name</label>
                                <input type="text" class="form-control" name="ChildName" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" name="Email" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Contact Number</label>
                                <input type="number" class="form-control" name="Contact" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input type="text" class="form-control" name="Address" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-section">
                            <h5>Medical Information</h5>
                            <div class="mb-3">
                                <label class="form-label">Weight (kg)</label>
                                <input type="number" class="form-control" name="Weight" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Height (cm)</label>
                                <input type="number" class="form-control" name="Height" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Blood Group</label>
                                <select class="form-select" name="BloodGroup" required>
                                    <option value="A+">A+</option>
                                    <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                    <option value="B-">B-</option>
                                    <option value="O+">O+</option>
                                    <option value="O-">O-</option>
                                    <option value="AB+">AB+</option>
                                    <option value="AB-">AB-</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Gender</label>
                                <select class="form-select" name="Gender" required>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Birth Date</label>
                                <input type="date" class="form-control" name="BirthDate" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Birth Certificate</label>
                                <input type="file" class="form-control" name="BirthCertificate" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control" name="Password" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary" name="submit-register">Register</button>
                </div>
                <div class="text-center mt-4">
                    <p>Already have an account? <a href="index.jsp" class="login-link">Login</a></p>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
