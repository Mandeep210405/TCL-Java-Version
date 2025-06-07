<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TCL - Contact Us</title>
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
            transition: transform 0.3s ease;
            margin-bottom: 2rem;
        }

        .card:hover {
            transform: translateY(-5px);
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

        .contact-title {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 2rem;
        }

        .form-label {
            font-weight: 500;
            color: var(--text-color);
        }

        .card-body {
            padding: 2.5rem;
        }

        .container {
            padding-top: 2rem;
        }

        .contact-info {
            margin-top: 2rem;
        }

        .contact-info i {
            color: var(--primary-color);
            font-size: 1.5rem;
            margin-right: 1rem;
        }

        .contact-info p {
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
                        <a class="nav-link active" href="contact.jsp">Contact</a>
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
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="contact-title">Contact Us</h3>
                        <% if(request.getAttribute("contactSuccess") != null) { %>
                            <div class="alert alert-success"><%= request.getAttribute("contactSuccess") %></div>
                        <% } %>
                        <% if(request.getAttribute("contactError") != null) { %>
                            <div class="alert alert-danger"><%= request.getAttribute("contactError") %></div>
                        <% } %>
                        <form method="POST" action="contact">
                            <div class="mb-4">
                                <label class="form-label">Your Name</label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="mb-4">
                                <label class="form-label">Email Address</label>
                                <input type="email" class="form-control" name="email" required>
                            </div>
                            <div class="mb-4">
                                <label class="form-label">Your Query</label>
                                <textarea class="form-control" name="query" rows="5" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="contact-title">Get in Touch</h3>
                        <div class="contact-info">
                            <p><i class="fas fa-map-marker-alt"></i> 123 Health Street, Medical District, City</p>
                            <p><i class="fas fa-phone"></i> +1 234 567 8900</p>
                            <p><i class="fas fa-envelope"></i> info@tcl.com</p>
                            <p><i class="fas fa-clock"></i> Monday - Friday: 9:00 AM - 5:00 PM</p>
                        </div>
                        <div class="mt-4">
                            <h5 class="mb-3">Follow Us</h5>
                            <div class="d-flex">
                                <a href="#" class="me-3 text-decoration-none">
                                    <i class="fab fa-facebook fa-2x" style="color: var(--primary-color);"></i>
                                </a>
                                <a href="#" class="me-3 text-decoration-none">
                                    <i class="fab fa-twitter fa-2x" style="color: var(--primary-color);"></i>
                                </a>
                                <a href="#" class="me-3 text-decoration-none">
                                    <i class="fab fa-instagram fa-2x" style="color: var(--primary-color);"></i>
                                </a>
                                <a href="#" class="text-decoration-none">
                                    <i class="fab fa-linkedin fa-2x" style="color: var(--primary-color);"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
