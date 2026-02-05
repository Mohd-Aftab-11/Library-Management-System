<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="Shortcut Icon" type="image/ico" href="favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration - Library Management System</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto+Slab:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --success-color: #27ae60;
            --light-color: #f8f9fa;
            --dark-color: #2c3e50;
            --gradient-bg: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --gradient-primary: linear-gradient(135deg, #2c3e50, #4a6491);
            --gradient-secondary: linear-gradient(135deg, #3498db, #2ecc71);
            --gradient-accent: linear-gradient(135deg, #e74c3c, #f39c12);
            --gradient-success: linear-gradient(135deg, #27ae60, #2ecc71);
            --shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            --shadow-hover: 0 10px 30px rgba(0, 0, 0, 0.2);
            --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
            color: #333;
            line-height: 1.6;
            padding-top: 70px;
            overflow-x: hidden;
            min-height: 100vh;
            position: relative;
            padding-bottom: 50px;
        }

        /* Enhanced Navbar */
        .navbar {
            background: var(--gradient-primary);
            padding: 0.3rem 1.2rem;
            box-shadow: var(--shadow);
            transition: var(--transition);
            height: 70px;
            min-height: 70px;
            backdrop-filter: blur(10px);
            border-bottom: 3px solid var(--secondary-color);
        }

        .navbar.scrolled {
            padding: 0.3rem 1rem;
        }

        .navbar-brand {
            font-family: 'Roboto Slab', serif;
            font-weight: 700;
            font-size: 1.5rem !important;
            display: flex;
            align-items: center;
        }

        .brand-icon {
            background: white;
            width: 35px;
            height: 35px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            color: var(--secondary-color);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            transition: var(--transition);
        }

        .brand-text {
            color: white;
            font-size: 1.4rem;
            letter-spacing: 0.3px;
        }

        .brand-subtext {
            font-size: 0.6rem;
            color: rgba(255,255,255,0.8);
            display: block;
            font-weight: 400;
        }

        .navbar-toggler {
            border: 2px solid white;
            padding: 0.4rem;
            transition: var(--transition);
            order: 3;
            margin-left: auto;
        }

        .navbar-toggler:hover {
            background: rgba(255,255,255,0.1);
        }

        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='30' height='30' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(255, 255, 255, 0.9)' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
            width: 24px;
            height: 24px;
        }

        .nav-link {
            color: white !important;
            font-weight: 500;
            padding: 0.4rem 1rem !important;
            margin: 0 0.3rem;
            border-radius: 20px;
            transition: var(--transition);
            position: relative;
            font-size: 0.9rem;
        }
        
        .nav-link:hover {
            background-color: var(--secondary-color);
            color: white !important;
            text-decoration: none;
            transform: translateY(-2px);
        }

        .nav-link.active {
            background: var(--secondary-color);
            color: white !important;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.4);
        }

        /* Hero Section */
        .hero-section {
            position: relative;
            min-height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            padding: 3rem 0;
            margin-bottom: 2rem;
        }

        .img {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            z-index: -1;
            animation: ani 8s infinite linear;
            opacity: 0.9;
        }

        @keyframes ani {
            0% { background-image: url('pexels-cottonbro-4861352.jpg'); }
            50% { background-image: url('pexels-kseniachernaya-3952078.jpg'); }
            100% { background-image: url('https://cache.careers360.mobi/media/presets/720X480/colleges/social-media/media-gallery/13757/2018/11/29/Campus%20view%20of%20Sacred%20Heart%20Degree%20College%20Sitapur_Campus-View.jpg'); }
        }

        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(44, 62, 80, 0.9) 0%, rgba(52, 152, 219, 0.8) 100%);
        }

        .hero-content {
            position: relative;
            z-index: 2;
            color: white;
            text-align: center;
            max-width: 800px;
            padding: 1.5rem;
        }

        .hero-title {
            font-family: 'Roboto Slab', serif;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .hero-subtitle {
            font-size: 1rem;
            margin-bottom: 1.5rem;
            opacity: 0.9;
        }

        /* Registration Container */
        .registration-container {
            max-width: 500px;
            margin: 0 auto 3rem auto;
            animation: fadeInUp 0.8s ease-out;
        }

        .registration-card {
            background: white;
            border-radius: 20px;
            box-shadow: var(--shadow-hover);
            overflow: hidden;
            transition: var(--transition);
        }

        .registration-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
        }

        .card-header {
            background: var(--gradient-primary);
            color: white;
            padding: 1.5rem;
            text-align: center;
            border-bottom: 3px solid var(--secondary-color);
        }

        .card-header h2 {
            font-family: 'Roboto Slab', serif;
            font-weight: 700;
            margin: 0;
            font-size: 1.8rem;
        }

        .card-header .header-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: white;
        }

        .card-body {
            padding: 2rem;
        }

        /* Form Styling */
        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.95rem;
        }

        .form-control {
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            transition: var(--transition);
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            font-family: 'Poppins', sans-serif;
        }

        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            outline: none;
        }

        .form-control::placeholder {
            color: #999;
            font-size: 0.9rem;
        }

        select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 0.75rem center;
            background-size: 16px 12px;
            padding-right: 2.5rem;
            cursor: pointer;
        }

        /* Button Styling */
        .btn-submit {
            background: var(--gradient-success);
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 25px;
            font-weight: 600;
            font-size: 1.1rem;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.8rem;
            width: 100%;
            margin-top: 1rem;
            box-shadow: 0 4px 15px rgba(39, 174, 96, 0.3);
            cursor: pointer;
            font-family: 'Poppins', sans-serif;
        }

        .btn-submit:hover {
            background: linear-gradient(135deg, #219653, #27ae60);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(39, 174, 96, 0.4);
        }

        .btn-back {
            background: var(--gradient-secondary);
            color: white;
            border: none;
            padding: 0.8rem 2rem;
            border-radius: 25px;
            font-weight: 600;
            font-size: 1rem;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            width: 100%;
            margin-top: 1rem;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
            text-decoration: none;
            text-align: center;
        }

        .btn-back:hover {
            background: var(--gradient-primary);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(52, 152, 219, 0.4);
        }

        /* Footer */
        .footer {
            background: linear-gradient(135deg, #1a2530 0%, #2c3e50 100%);
            color: white;
            padding: 3rem 0 2rem 0;
            position: relative;
            z-index: 10;
            margin-top: 4rem;
        }

        .footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: var(--gradient-secondary);
            z-index: 1;
        }

        .footer h4 {
            font-family: 'Roboto Slab', serif;
            font-weight: 700;
            color: white;
            margin-bottom: 1.2rem;
            font-size: 1.1rem;
            position: relative;
            padding-bottom: 0.5rem;
        }

        .footer h4::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 40px;
            height: 2px;
            background: var(--gradient-secondary);
            border-radius: 2px;
        }

        .footer a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            display: block;
            margin-bottom: 0.6rem;
            transition: var(--transition);
            font-size: 0.85rem;
        }

        .footer a:hover {
            color: white;
            transform: translateX(5px);
        }

        .footer .contact-info {
            margin-top: 1rem;
            font-size: 0.85rem;
            color: rgba(255, 255, 255, 0.8);
        }

        .footer .contact-info i {
            width: 20px;
            color: var(--secondary-color);
        }

        .footer .social-links {
            display: flex;
            gap: 15px;
            margin-top: 1.5rem;
        }

        .footer .social-links a {
            background: rgba(255, 255, 255, 0.1);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: var(--transition);
            margin-bottom: 0;
        }

        .footer .social-links a:hover {
            background: var(--secondary-color);
            transform: translateY(-3px);
        }

        .footer .quick-links {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 1rem;
        }

        .footer .quick-links a {
            background: rgba(255, 255, 255, 0.1);
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            margin-bottom: 5px;
        }

        .footer .quick-links a:hover {
            background: var(--secondary-color);
        }

        /* Fixed Copyright Section */
        .copyright {
            background: var(--gradient-primary);
            padding: 0.8rem !important;
            border-top: 1px solid rgba(255, 255, 255, 0.2) !important;
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
        }

        .copyright p {
            margin: 0;
            font-size: 0.85rem;
            color: rgba(255, 255, 255, 0.9);
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                padding-top: 60px;
            }
            
            .navbar {
                padding: 0.3rem 1rem;
                min-height: 60px;
                height: 60px;
            }
            
            .hero-title {
                font-size: 1.8rem;
            }
            
            .registration-container {
                max-width: 90%;
                margin: 0 auto 2rem auto;
            }
            
            .card-body {
                padding: 1.5rem;
            }
        }

        @media (max-width: 576px) {
            .hero-title {
                font-size: 1.5rem;
            }
            
            .card-header h2 {
                font-size: 1.5rem;
            }
            
            .card-header .header-icon {
                font-size: 2rem;
            }
            
            .btn-submit, .btn-back {
                padding: 0.8rem 1rem;
                font-size: 0.9rem;
            }
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 10px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        ::-webkit-scrollbar-thumb {
            background: var(--secondary-color);
            border-radius: 6px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: var(--primary-color);
        }

        /* Password Strength Indicator */
        .password-strength {
            margin-top: 0.5rem;
            font-size: 0.8rem;
        }

        .strength-weak {
            color: #e74c3c;
        }

        .strength-medium {
            color: #f39c12;
        }

        .strength-strong {
            color: #27ae60;
        }

        /* Form Validation Styles */
        .is-invalid {
            border-color: #e74c3c !important;
        }

        .invalid-feedback {
            display: none;
            color: #e74c3c;
            font-size: 0.85rem;
            margin-top: 0.25rem;
        }

        .is-invalid ~ .invalid-feedback {
            display: block;
        }
    </style>
</head>
<body>
    <!-- Enhanced Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <!-- Brand Logo -->
            <a class="navbar-brand" href="index.html">
                <div class="brand-icon">
                    <i class="fas fa-book-open fa-lg"></i>
                </div>
                <div>
                    <span class="brand-text">Library Hub</span>
                    <span class="brand-subtext">Sacred Heart Degree College</span>
                </div>
            </a>
            
            <!-- Mobile Toggle Button -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMain">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navigation Menu -->
            <div class="collapse navbar-collapse" id="navbarMain">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about_us.jsp">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="blog.jsp">Blog</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="Registration.jsp">Registration</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section fade-in">
        <div class="img"></div>
        <div class="hero-overlay"></div>
        <div class="container">
            <div class="hero-content">
                <h1 class="hero-title">Create Your Library Account</h1>
                <p class="hero-subtitle">Join the Sacred Heart Degree College Library community. Register now to access our extensive collection of books and digital resources.</p>
            </div>
        </div>
    </section>

    <!-- Registration Form -->
    <div class="container registration-container">
        <div class="registration-card">
            <div class="card-header">
                <div class="header-icon">
                    <i class="fas fa-user-plus"></i>
                </div>
                <h2>New Account Registration</h2>
            </div>
            <div class="card-body">
                <form action="RegistrationConf1" method="post" id="registrationForm">
                    <div class="form-group">
                        <label for="username" class="form-label">
                            <i class="fas fa-user"></i> Username:
                        </label>
                        <input type="text" id="username" name="username" class="form-control" 
                               placeholder="Enter your username" required>
                        <div class="invalid-feedback">
                            Please enter a valid username (minimum 3 characters).
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="password" class="form-label">
                            <i class="fas fa-lock"></i> Password:
                        </label>
                        <input type="password" id="password" name="password" class="form-control" 
                               placeholder="Enter your password" required>
                        <div class="invalid-feedback">
                            Password must be at least 6 characters long.
                        </div>
                        <div class="password-strength" id="passwordStrength"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword" class="form-label">
                            <i class="fas fa-lock"></i> Confirm Password:
                        </label>
                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" 
                               placeholder="Confirm your password" required>
                        <div class="invalid-feedback">
                            Passwords do not match.
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="role" class="form-label">
                            <i class="fas fa-user-tag"></i> Role:
                        </label>
                        <select id="role" name="role" class="form-control" required>
                            <option value="">Select Role</option>
                            <option value="Student">Student</option>
                        </select>
                        <div class="invalid-feedback">
                            Please select a role.
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="email" class="form-label">
                            <i class="fas fa-envelope"></i> Email:
                        </label>
                        <input type="email" id="email" name="email" class="form-control" 
                               placeholder="Enter your email address" required>
                        <div class="invalid-feedback">
                            Please enter a valid email address.
                        </div>
                    </div>
                    
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="terms" required>
                        <label class="form-check-label" for="terms">
                            I agree to the <a href="#" style="color: var(--secondary-color);">Terms & Conditions</a> and <a href="#" style="color: var(--secondary-color);">Privacy Policy</a>
                        </label>
                        <div class="invalid-feedback">
                            You must agree to the terms and conditions.
                        </div>
                    </div>
                    
                    <button type="submit" class="btn-submit">
                        <i class="fas fa-user-plus"></i> Create Account
                    </button>
                </form>
                
                <a href="index.html" class="btn-back">
                    <i class="fas fa-arrow-left"></i> Back to Login Page
                </a>
                
                <div class="text-center mt-3">
                    <p class="text-muted">
                        Already have an account? 
                        <a href="login.jsp" style="color: var(--secondary-color); font-weight: 500;">Login here</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Quick Links</h4>
                    <a href="index.html"><i class="fas fa-chevron-right mr-2"></i>Home</a>
                    <a href="about_us.jsp"><i class="fas fa-chevron-right mr-2"></i>About Us</a>
                    <a href="blog.jsp"><i class="fas fa-chevron-right mr-2"></i>Blog</a>
                    <a href="Registration.jsp"><i class="fas fa-chevron-right mr-2"></i>Registration</a>
                    <a href="login.jsp"><i class="fas fa-chevron-right mr-2"></i>Login</a>
                    <a href="forgot_password.jsp"><i class="fas fa-chevron-right mr-2"></i>Forgot Password</a>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Resources</h4>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>E-Books</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Research Papers</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Journals</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Magazines</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Digital Archives</a>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Contact Info</h4>
                    <div class="contact-info">
                        <p><i class="fas fa-map-marker-alt mr-2"></i> Sacred Heart Degree College<br>Sitapur, Uttar Pradesh</p>
                        <p><i class="fas fa-phone mr-2"></i> +91 9876543210</p>
                        <p><i class="fas fa-envelope mr-2"></i> library@shdc.edu.in</p>
                        <p><i class="fas fa-clock mr-2"></i> Mon-Sat: 8:45 AM - 2:30 PM</p>
                    </div>
                    <div class="social-links">
                        <a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" title="Twitter"><i class="fab fa-twitter"></i></a>
                        <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
                        <a href="#" title="YouTube"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>College Info</h4>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Academic Calendar</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Examination Schedule</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Faculty Directory</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Campus Facilities</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Alumni Network</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Fixed Copyright Section -->
    <div class="copyright text-center">
        <p>© <span id="currentYear"></span> Library Hub - Sacred Heart Degree College. All rights reserved.</p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Set current year in footer
        document.getElementById('currentYear').textContent = new Date().getFullYear();

        // Navbar scroll effect
        $(window).scroll(function() {
            if ($(window).scrollTop() > 30) {
                $('.navbar').addClass('scrolled');
            } else {
                $('.navbar').removeClass('scrolled');
            }
        });

        // Mobile menu close on click
        $('.navbar-nav .nav-link').click(function() {
            if ($(window).width() < 992) {
                $('.navbar-collapse').collapse('hide');
            }
        });

        // Password strength indicator
        $('#password').on('input', function() {
            var password = $(this).val();
            var strengthText = '';
            var strengthClass = '';
            
            if (password.length === 0) {
                strengthText = '';
            } else if (password.length < 6) {
                strengthText = 'Weak';
                strengthClass = 'strength-weak';
            } else if (password.length < 10) {
                strengthText = 'Medium';
                strengthClass = 'strength-medium';
            } else {
                // Check for special characters and numbers
                var hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);
                var hasNumber = /\d/.test(password);
                var hasUpper = /[A-Z]/.test(password);
                
                if (hasSpecial && hasNumber && hasUpper) {
                    strengthText = 'Strong';
                    strengthClass = 'strength-strong';
                } else {
                    strengthText = 'Medium';
                    strengthClass = 'strength-medium';
                }
            }
            
            $('#passwordStrength').html(strengthText ? 'Password strength: <span class="' + strengthClass + '">' + strengthText + '</span>' : '');
        });

        // Password confirmation validation
        $('#confirmPassword').on('input', function() {
            var password = $('#password').val();
            var confirmPassword = $(this).val();
            
            if (confirmPassword && password !== confirmPassword) {
                $(this).addClass('is-invalid');
            } else {
                $(this).removeClass('is-invalid');
            }
        });

        // Form validation
        $('#registrationForm').on('submit', function(e) {
            var isValid = true;
            var username = $('#username').val().trim();
            var password = $('#password').val();
            var confirmPassword = $('#confirmPassword').val();
            var role = $('#role').val();
            var email = $('#email').val().trim();
            var terms = $('#terms').is(':checked');
            
            // Reset validation states
            $('.form-control').removeClass('is-invalid');
            $('.invalid-feedback').hide();
            
            // Validate username
            if (username.length < 3) {
                $('#username').addClass('is-invalid').next('.invalid-feedback').show();
                isValid = false;
            }
            
            // Validate password
            if (password.length < 6) {
                $('#password').addClass('is-invalid').next('.invalid-feedback').show();
                isValid = false;
            }
            
            // Validate password confirmation
            if (password !== confirmPassword) {
                $('#confirmPassword').addClass('is-invalid').next('.invalid-feedback').show();
                isValid = false;
            }
            
            // Validate role
            if (!role) {
                $('#role').addClass('is-invalid').next('.invalid-feedback').show();
                isValid = false;
            }
            
            // Validate email
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                $('#email').addClass('is-invalid').next('.invalid-feedback').show();
                isValid = false;
            }
            
            // Validate terms
            if (!terms) {
                $('#terms').addClass('is-invalid').next('.invalid-feedback').show();
                isValid = false;
            }
            
            if (!isValid) {
                e.preventDefault();
                // Scroll to first error
                $('.is-invalid').first().focus();
            } else {
                // Show loading state
                $('.btn-submit').html('<i class="fas fa-spinner fa-spin"></i> Creating Account...').prop('disabled', true);
            }
            
            return isValid;
        });

        // Real-time validation
        $('.form-control').on('blur', function() {
            var $input = $(this);
            var $error = $input.next('.invalid-feedback');
            
            if ($input.attr('id') === 'username') {
                if ($input.val().trim().length < 3) {
                    $input.addClass('is-invalid');
                    $error.show();
                } else {
                    $input.removeClass('is-invalid');
                    $error.hide();
                }
            }
            
            if ($input.attr('id') === 'email') {
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test($input.val().trim())) {
                    $input.addClass('is-invalid');
                    $error.show();
                } else {
                    $input.removeClass('is-invalid');
                    $error.hide();
                }
            }
        });
    </script>
</body>
</html>