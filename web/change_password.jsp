<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;

    if (session == null || role == null || (!role.equals("Student") && !role.equals("Librarian"))) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="Shortcut Icon" type="image/ico" href="favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password - Library Management System</title>

    <!-- Bootstrap CSS -->
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
            --warning-color: #f39c12;
            --info-color: #17a2b8;
            --light-color: #f8f9fa;
            --dark-color: #2c3e50;
            --gradient-primary: linear-gradient(135deg, #2c3e50, #4a6491);
            --gradient-secondary: linear-gradient(135deg, #3498db, #2ecc71);
            --gradient-accent: linear-gradient(135deg, #e74c3c, #f39c12);
            --gradient-warning: linear-gradient(135deg, #f39c12, #e67e22);
            --gradient-success: linear-gradient(135deg, #27ae60, #2ecc71);
            --gradient-info: linear-gradient(135deg, #17a2b8, #20c997);
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
            overflow-x: hidden;
            min-height: 100vh;
            position: relative;
            padding-bottom: 50px;
        }

        /* Enhanced Navbar */
        .navbar {
            background: var(--gradient-primary);
            padding: 0.5rem 1.5rem;
            box-shadow: var(--shadow);
            transition: var(--transition);
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
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
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
            font-size: 0.7rem;
            color: rgba(255,255,255,0.8);
            display: block;
            font-weight: 400;
        }

        .navbar-toggler {
            border: 2px solid white;
            padding: 0.4rem;
            transition: var(--transition);
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
            padding: 0.5rem 1.2rem !important;
            margin: 0 0.3rem;
            border-radius: 25px;
            transition: var(--transition);
            position: relative;
            font-size: 0.95rem;
        }
        
        .nav-link:hover {
            background-color: var(--success-color);
            color: black !important;
            text-decoration: none;
            transform: translateY(-2px);
        }

        .nav-link.active {
            background: var(--secondary-color);
            color: white !important;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.4);
        }

        /* Dashboard Container */
        .dashboard-container {
            padding: 2rem 1rem;
            margin-top: 80px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        /* Welcome Header */
        .welcome-header {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            box-shadow: var(--shadow);
            border-left: 5px solid var(--info-color);
            animation: fadeInUp 0.8s ease-out;
        }

        .welcome-header h2 {
            color: var(--primary-color);
            font-family: 'Roboto Slab', serif;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-top: 1rem;
        }

        .user-avatar {
            width: 60px;
            height: 60px;
            background: var(--gradient-info);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            font-weight: 600;
            box-shadow: 0 4px 10px rgba(23, 162, 184, 0.3);
        }

        .user-details h3 {
            margin: 0;
            color: var(--primary-color);
            font-weight: 600;
        }

        .user-details .badge {
            background: var(--gradient-info);
            font-size: 0.8rem;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
        }

        /* Form Container */
        .form-container {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: var(--shadow);
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        .section-header {
            display: flex;
            align-items: center;
            margin-bottom: 1.8rem;
            padding-bottom: 0.8rem;
            border-bottom: 2px solid #eee;
        }

        .section-icon {
            width: 50px;
            height: 50px;
            background: var(--gradient-info);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            color: white;
            font-size: 1.2rem;
            box-shadow: 0 4px 10px rgba(44, 62, 80, 0.2);
        }

        .section-header h3 {
            color: var(--primary-color);
            font-family: 'Roboto Slab', serif;
            font-weight: 600;
            margin: 0;
            font-size: 1.4rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            display: block;
        }

        .form-group label i {
            margin-right: 8px;
            color: var(--secondary-color);
        }

        .form-control {
            border-radius: 10px;
            padding: 0.75rem 1rem;
            border: 2px solid #e0e0e0;
            transition: var(--transition);
            font-family: 'Poppins', sans-serif;
        }

        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            outline: none;
        }

        .input-group {
            position: relative;
        }

        .toggle-password {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: var(--gray-color);
            z-index: 10;
            background: transparent;
            border: none;
            font-size: 1rem;
        }

        .btn-submit {
            width: 100%;
            padding: 0.8rem 1.5rem;
            border-radius: 10px;
            font-weight: 600;
            font-size: 1rem;
            transition: var(--transition);
            border: none;
            cursor: pointer;
            font-family: 'Poppins', sans-serif;
            background: var(--gradient-info);
            color: white;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(23, 162, 184, 0.3);
        }

        .btn-back {
            display: inline-block;
            padding: 0.6rem 1.5rem;
            border-radius: 10px;
            font-weight: 600;
            font-size: 0.9rem;
            transition: var(--transition);
            border: 2px solid var(--secondary-color);
            cursor: pointer;
            font-family: 'Poppins', sans-serif;
            background: white;
            color: var(--secondary-color);
            text-decoration: none;
            text-align: center;
        }

        .btn-back:hover {
            background: var(--secondary-color);
            color: white;
            transform: translateY(-2px);
            text-decoration: none;
        }

        /* Alert Messages */
        .alert-custom {
            border-radius: 10px;
            padding: 1rem;
            margin-bottom: 1.5rem;
            border-left: 4px solid;
            animation: fadeInUp 0.5s ease-out;
        }

        .alert-success {
            background-color: #d4edda;
            border-left-color: var(--success-color);
            color: #155724;
        }

        .alert-danger {
            background-color: #f8d7da;
            border-left-color: var(--accent-color);
            color: #721c24;
        }

        .alert-warning {
            background-color: #fff3cd;
            border-left-color: var(--warning-color);
            color: #856404;
        }

        /* Password Strength Meter */
        .password-strength {
            margin-top: 0.5rem;
        }

        .strength-bar {
            height: 4px;
            border-radius: 2px;
            transition: var(--transition);
        }

        .strength-text {
            font-size: 0.7rem;
            margin-top: 0.25rem;
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

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .floating {
            animation: float 3s ease-in-out infinite;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .dashboard-container {
                padding: 1rem;
                margin-top: 70px;
            }

            .welcome-header {
                padding: 1.5rem;
                text-align: center;
            }

            .user-info {
                flex-direction: column;
                text-align: center;
            }

            .section-header {
                flex-direction: column;
                text-align: center;
            }

            .section-icon {
                margin-right: 0;
                margin-bottom: 0.8rem;
            }

            .footer .row > div {
                margin-bottom: 2rem;
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

        /* Utility Classes */
        .text-gradient {
            background: var(--gradient-secondary);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }
    </style>
</head>

<body>
    <!-- Enhanced Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <!-- Brand Logo -->
            <a class="navbar-brand" href="<%= role.equals("Student") ? "student_dashboard.jsp" : "librarian_dashboard.jsp" %>">
                <div class="brand-icon">
                    <i class="fas fa-book-open fa-lg"></i>
                </div>
                <div>
                    <span class="brand-text">Library Hub</span>
                    <span class="brand-subtext"><%= role.equals("Student") ? "Student Dashboard" : "Librarian Dashboard" %></span>
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
                        <a class="nav-link" href="<%= role.equals("Student") ? "student_dashboard.jsp" : "librarian_dashboard.jsp" %>">
                            <i class="fas fa-tachometer-alt mr-2"></i>Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="change_password.jsp">
                            <i class="fas fa-lock mr-2"></i>Change Password
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Logout">
                            <i class="fas fa-sign-out-alt mr-2"></i>Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Dashboard Container -->
    <div class="dashboard-container">
        <!-- Welcome Header -->
        <div class="welcome-header">
            <h2>Change Password</h2>
            <p class="text-muted">Keep your account secure by updating your password regularly</p>
            <div class="user-info">
                <div class="user-avatar floating">
                    <%= ((String) session.getAttribute("username")).charAt(0) %>
                </div>
                <div class="user-details">
                    <h3><%= session.getAttribute("username") %></h3>
                    <span class="badge"><%= role %></span>
                </div>
            </div>
        </div>

        <!-- Change Password Form -->
        <div class="form-container">
            <div class="section-header">
                <div class="section-icon">
                    <i class="fas fa-key"></i>
                </div>
                <h3>Update Your Password</h3>
            </div>

            <!-- Display messages -->
            <%
                String message = (String) request.getAttribute("message");
                String error = (String) request.getAttribute("error");
                if (message != null && !message.isEmpty()) {
            %>
                <div class="alert-custom alert-success">
                    <i class="fas fa-check-circle mr-2"></i> <%= message %>
                </div>
            <%
                }
                if (error != null && !error.isEmpty()) {
            %>
                <div class="alert-custom alert-danger">
                    <i class="fas fa-exclamation-circle mr-2"></i> <%= error %>
                </div>
            <%
                }
            %>

            <form action="ChangePasswordServlet1" method="post" id="passwordForm">
                <!-- Username (Auto-filled from session) -->
                <div class="form-group">
                    <label for="username"><i class="fas fa-user"></i> Username</label>
                    <input type="text" id="username" name="username" 
                           class="form-control" value="<%= session.getAttribute("username") %>" required readonly>
                </div>

                <!-- Old Password -->
                <div class="form-group">
                    <label for="old_password"><i class="fas fa-shield-alt"></i> Current Password</label>
                    <div class="input-group">
                        <input type="password" id="old_password" name="old_password" 
                               class="form-control" placeholder="Enter your current password" required>
                        <button type="button" class="toggle-password" data-target="old_password">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <!-- New Password -->
                <div class="form-group">
                    <label for="new_password"><i class="fas fa-lock"></i> New Password</label>
                    <div class="input-group">
                        <input type="password" id="new_password" name="new_password" 
                               class="form-control" placeholder="Enter new password" required>
                        <button type="button" class="toggle-password" data-target="new_password">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                    <div class="password-strength" id="passwordStrength">
                        <div class="strength-bar"></div>
                        <div class="strength-text"></div>
                    </div>
                </div>

                <!-- Confirm Password -->
                <div class="form-group">
                    <label for="confirm_password"><i class="fas fa-check-circle"></i> Confirm New Password</label>
                    <div class="input-group">
                        <input type="password" id="confirm_password" name="confirm_password" 
                               class="form-control" placeholder="Confirm your new password" required>
                        <button type="button" class="toggle-password" data-target="confirm_password">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                    <div id="passwordMatch" class="small mt-1"></div>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn-submit" id="submitBtn">
                    <i class="fas fa-save mr-2"></i> Update Password
                </button>
            </form>

            <div class="text-center mt-3">
                <a href="<%= role.equals("Student") ? "student_dashboard.jsp" : "librarian_dashboard.jsp" %>" class="btn-back">
                    <i class="fas fa-arrow-left mr-2"></i> Back to Dashboard
                </a>
            </div>
        </div>

        <!-- Password Tips -->
        <div class="form-container" style="margin-top: 1rem;">
            <div class="section-header">
                <div class="section-icon" style="background: var(--gradient-success);">
                    <i class="fas fa-info-circle"></i>
                </div>
                <h3>Password Tips</h3>
            </div>
            <ul class="list-unstyled" style="margin-bottom: 0;">
                <li><i class="fas fa-check-circle text-success mr-2"></i> Use at least 8 characters</li>
                <li><i class="fas fa-check-circle text-success mr-2"></i> Include uppercase and lowercase letters</li>
                <li><i class="fas fa-check-circle text-success mr-2"></i> Add numbers and special characters</li>
                <li><i class="fas fa-check-circle text-success mr-2"></i> Avoid using common words or personal information</li>
                <li><i class="fas fa-check-circle text-success mr-2"></i> Don't reuse passwords from other accounts</li>
            </ul>
        </div>
    </div>

    <!-- Main Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Quick Links</h4>
                    <a href="<%= role.equals("Student") ? "student_dashboard.jsp" : "librarian_dashboard.jsp" %>"><i class="fas fa-chevron-right mr-2"></i>Dashboard</a>
                    <a href="search_book.jsp"><i class="fas fa-chevron-right mr-2"></i>Search Books</a>
                    <a href="change_password.jsp"><i class="fas fa-chevron-right mr-2"></i>Change Password</a>
                    <a href="profile.jsp"><i class="fas fa-chevron-right mr-2"></i>My Profile</a>
                    <div class="quick-links">
                        <a href="#">FAQ</a>
                        <a href="#">Help Desk</a>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Library Resources</h4>
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
                    <h4><%= role.equals("Student") ? "Student Tools" : "Admin Tools" %></h4>
                    <a href="viewallfines.jsp"><i class="fas fa-chevron-right mr-2"></i>View Fines</a>
                    <a href="feedback.jsp"><i class="fas fa-chevron-right mr-2"></i>Give Feedback</a>
                    <a href="change_password.jsp"><i class="fas fa-chevron-right mr-2"></i>Change Password</a>
                    <a href="search_book.jsp"><i class="fas fa-chevron-right mr-2"></i>Search Books</a>
                    <a href="Logout"><i class="fas fa-chevron-right mr-2"></i>Logout</a>
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

        // Toggle password visibility
        $('.toggle-password').click(function() {
            const targetId = $(this).data('target');
            const input = $('#' + targetId);
            const icon = $(this).find('i');
            
            if (input.attr('type') === 'password') {
                input.attr('type', 'text');
                icon.removeClass('fa-eye').addClass('fa-eye-slash');
            } else {
                input.attr('type', 'password');
                icon.removeClass('fa-eye-slash').addClass('fa-eye');
            }
        });

        // Password strength meter
        $('#new_password').on('input', function() {
            const password = $(this).val();
            const strengthBar = $('.strength-bar');
            const strengthText = $('.strength-text');
            
            let strength = 0;
            let message = '';
            let color = '';
            
            if (password.length === 0) {
                strengthBar.css({width: '0%', background: '#e0e0e0'});
                strengthText.text('');
                return;
            }
            
            // Length check
            if (password.length >= 8) strength += 25;
            else strength += 10;
            
            // Uppercase check
            if (/[A-Z]/.test(password)) strength += 25;
            
            // Lowercase check
            if (/[a-z]/.test(password)) strength += 25;
            
            // Number check
            if (/[0-9]/.test(password)) strength += 15;
            
            // Special character check
            if (/[^A-Za-z0-9]/.test(password)) strength += 10;
            
            if (strength < 30) {
                message = 'Weak';
                color = '#e74c3c';
            } else if (strength < 60) {
                message = 'Fair';
                color = '#f39c12';
            } else if (strength < 80) {
                message = 'Good';
                color = '#3498db';
            } else {
                message = 'Strong';
                color = '#27ae60';
            }
            
            strengthBar.css({width: strength + '%', background: color, borderRadius: '2px'});
            strengthText.text('Password Strength: ' + message).css('color', color);
        });

        // Password match validation
        $('#confirm_password').on('input', function() {
            const newPassword = $('#new_password').val();
            const confirmPassword = $(this).val();
            const matchDiv = $('#passwordMatch');
            
            if (confirmPassword.length === 0) {
                matchDiv.html('');
                return;
            }
            
            if (newPassword === confirmPassword) {
                matchDiv.html('<i class="fas fa-check-circle text-success"></i> Passwords match!');
                matchDiv.css('color', '#27ae60');
            } else {
                matchDiv.html('<i class="fas fa-times-circle text-danger"></i> Passwords do not match!');
                matchDiv.css('color', '#e74c3c');
            }
        });

        // Form validation before submit
        $('#passwordForm').on('submit', function(e) {
            const newPassword = $('#new_password').val();
            const confirmPassword = $('#confirm_password').val();
            
            if (newPassword !== confirmPassword) {
                e.preventDefault();
                $('#passwordMatch').html('<i class="fas fa-times-circle text-danger"></i> Passwords do not match!');
                $('#passwordMatch').css('color', '#e74c3c');
                return false;
            }
            
            if (newPassword.length < 6) {
                e.preventDefault();
                alert('Password must be at least 6 characters long!');
                return false;
            }
            
            // Show loading state
            const submitBtn = $('#submitBtn');
            submitBtn.html('<i class="fas fa-spinner fa-spin mr-2"></i> Updating...');
            submitBtn.prop('disabled', true);
        });

        // Mobile menu close on click
        $(document).ready(function() {
            $('.navbar-nav .nav-link').click(function() {
                if ($(window).width() < 992) {
                    $('.navbar-collapse').collapse('hide');
                }
            });
        });
    </script>
</body>
</html>