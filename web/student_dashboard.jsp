<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;

    if (session == null || role == null || !role.equals("Student")) {
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
    <title>Student Dashboard - Library Management System</title>

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
            max-width: 1400px;
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
            border-left: 5px solid var(--success-color);
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
            background: var(--gradient-success);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            font-weight: 600;
            box-shadow: 0 4px 10px rgba(39, 174, 96, 0.3);
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

        /* Dashboard Sections */
        .dashboard-section {
            margin-bottom: 3rem;
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        .section-header {
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 0.8rem;
            border-bottom: 2px solid #eee;
        }

        .section-icon {
            width: 50px;
            height: 50px;
            background: var(--gradient-primary);
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

        /* Dashboard Cards Grid */
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.5rem;
            margin-bottom: 1rem;
        }

        .dashboard-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            text-align: center;
            transition: var(--transition);
            box-shadow: var(--shadow);
            border: 2px solid transparent;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .dashboard-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: var(--gradient-secondary);
            opacity: 0;
            transition: var(--transition);
        }

        .dashboard-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-hover);
            border-color: var(--secondary-color);
        }

        .dashboard-card:hover::before {
            opacity: 1;
        }

        .card-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
            font-size: 1.8rem;
            color: white;
            transition: var(--transition);
        }

        .dashboard-card:hover .card-icon {
            transform: scale(1.1) rotate(5deg);
        }

        .card-icon.books { background: var(--gradient-primary); }
        .card-icon.attendance { background: var(--gradient-warning); }
        .card-icon.feedback { background: var(--gradient-info); }
        .card-icon.fines { background: var(--gradient-accent); }
        .card-icon.profile { background: var(--gradient-success); }
        .card-icon.search { background: var(--gradient-secondary); }

        .dashboard-card h4 {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 0.5rem;
            font-size: 1.1rem;
        }

        .dashboard-card p {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 1.5rem;
            line-height: 1.5;
        }

        .dashboard-card a {
            display: inline-block;
            padding: 0.6rem 1.5rem;
            background: var(--gradient-secondary);
            color: white;
            text-decoration: none;
            border-radius: 25px;
            font-weight: 500;
            font-size: 0.9rem;
            transition: var(--transition);
            border: 2px solid transparent;
            min-width: 140px;
        }

        .dashboard-card a:hover {
            background: white;
            color: var(--secondary-color);
            border-color: var(--secondary-color);
            transform: translateY(-2px);
        }

        /* Stats Cards */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            padding: 1.5rem;
            border-radius: 15px;
            box-shadow: var(--shadow);
            display: flex;
            align-items: center;
            transition: var(--transition);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-hover);
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            font-size: 1.5rem;
            color: white;
        }

        .stat-icon.books { background: var(--gradient-primary); }
        .stat-icon.issued { background: var(--gradient-warning); }
        .stat-icon.fines { background: var(--gradient-accent); }
        .stat-icon.attendance { background: var(--gradient-success); }

        .stat-info h3 {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--primary-color);
            margin: 0;
            line-height: 1;
        }

        .stat-info p {
            color: #666;
            margin: 0;
            font-size: 0.9rem;
        }

        /* Footer - Same as home page */
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

            .dashboard-grid {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .stats-container {
                grid-template-columns: 1fr;
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

        @media (min-width: 769px) and (max-width: 992px) {
            .dashboard-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (min-width: 1200px) {
            .dashboard-grid {
                grid-template-columns: repeat(4, 1fr);
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

        .pulse {
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(52, 152, 219, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(52, 152, 219, 0); }
            100% { box-shadow: 0 0 0 0 rgba(52, 152, 219, 0); }
        }
    </style>
</head>

<body>
    <!-- Enhanced Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <!-- Brand Logo -->
            <a class="navbar-brand" href="student_dashboard.jsp">
                <div class="brand-icon">
                    <i class="fas fa-book-open fa-lg"></i>
                </div>
                <div>
                    <span class="brand-text">Library Hub</span>
                    <span class="brand-subtext">Student Dashboard</span>
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
                        <a class="nav-link active" href="student_dashboard.jsp">
                            <i class="fas fa-tachometer-alt mr-2"></i>Dashboard
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
            <h2>Welcome, <span class="text-gradient"><%= session.getAttribute("username") %></span></h2>
            <p class="text-muted">Role: Student | Last Login: Today</p>
            <div class="user-info">
                <div class="user-avatar floating">
                    <%= ((String) session.getAttribute("username")).charAt(0) %>
                </div>
                <div class="user-details">
                    <h3><%= session.getAttribute("username") %></h3>
                    <span class="badge">Student</span>
                </div>
            </div>
        </div>

        <!-- Library Services Section -->
        <div class="dashboard-section">
            <div class="section-header">
                <div class="section-icon">
                    <i class="fas fa-book-open"></i>
                </div>
                <h3>Library Services</h3>
            </div>
            <div class="dashboard-grid">
                <div class="dashboard-card">
                    <div class="card-icon books">
                        <i class="fas fa-search"></i>
                    </div>
                    <h4>Search Books</h4>
                    <p>Browse our extensive collection of books, journals, and digital resources.</p>
                    <a href="search_book.jsp" class="pulse">Search Books</a>
                </div>
                <div class="dashboard-card">
                    <div class="card-icon feedback">
                        <i class="fas fa-comment-dots"></i>
                    </div>
                    <h4>Give Feedback</h4>
                    <p>Share your suggestions and feedback to help us improve.</p>
                    <a href="feedback.jsp">Give Feedback</a>
                </div>
                <div class="dashboard-card">
                    <div class="card-icon fines">
                        <i class="fas fa-money-check-alt"></i>
                    </div>
                    <h4>View Fines</h4>
                    <p>Check and manage pending fines for late returns.</p>
                    <a href="viewallfines.jsp">View Fines</a>
                </div>
            </div>
        </div>

        <!-- Attendance & Profile Section -->
        <div class="dashboard-section">
            <div class="section-header">
                <div class="section-icon">
                    <i class="fas fa-user-circle"></i>
                </div>
                <h3>Account & Attendance</h3>
            </div>
            <div class="dashboard-grid">
                <div class="dashboard-card">
                    <div class="card-icon attendance">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <h4>Mark Attendance</h4>
                    <p>Record your daily library visit attendance.</p>
                    <a href="attendance.jsp">Mark Attendance</a>
                </div>
                <div class="dashboard-card">
                    <div class="card-icon profile">
                        <i class="fas fa-user-cog"></i>
                    </div>
                    <h4>My Profile</h4>
                    <p>Update your personal information.</p>
                    <a href="profile.jsp">Manage Profile</a>
                </div>
                <div class="dashboard-card">
                    <div class="card-icon profile">
                        <i class="fas fa-lock"></i>
                    </div>
                    <h4>Change Password</h4>
                    <p>Update your account password for security.</p>
                    <a href="change_password.jsp">Change Password</a>
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
                    <a href="student_dashboard.jsp"><i class="fas fa-chevron-right mr-2"></i>Dashboard</a>
                    <a href="search_book.jsp"><i class="fas fa-chevron-right mr-2"></i>Search Books</a>
                    <a href="borrowed_books.jsp"><i class="fas fa-chevron-right mr-2"></i>My Books</a>
                    <a href="attendance.jsp"><i class="fas fa-chevron-right mr-2"></i>Mark Attendance</a>
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
                    <h4>Student Tools</h4>
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

        // Animate cards on scroll
        function checkScroll() {
            $('.dashboard-card').each(function() {
                var elementTop = $(this).offset().top;
                var elementBottom = elementTop + $(this).outerHeight();
                var viewportTop = $(window).scrollTop();
                var viewportBottom = viewportTop + $(window).height();
                
                if (elementBottom > viewportTop && elementTop < viewportBottom) {
                    $(this).addClass('animated');
                }
            });
        }

        $(window).on('scroll', checkScroll);
        checkScroll();

        // Mobile menu close on click
        $(document).ready(function() {
            $('.navbar-nav .nav-link').click(function() {
                if ($(window).width() < 992) {
                    $('.navbar-collapse').collapse('hide');
                }
            });

            // Simulate loading stats from backend
            function loadStats() {
                // These would typically be AJAX calls to fetch real data
                // For demo, setting random values that would be replaced by actual data
                $.ajax({
                    url: 'getStudentStats.jsp', // You'll need to create this endpoint
                    method: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        $('#totalBooks').text(data.borrowedBooks || 0);
                        $('#pendingReturns').text(data.pendingReturns || 0);
                        $('#totalFines').text('₹' + (data.totalFines || 0));
                        $('#attendanceCount').text(data.attendanceDays || 0);
                    },
                    error: function() {
                        // Fallback to random values for demo
                        $('#totalBooks').text(Math.floor(Math.random() * 5));
                        $('#pendingReturns').text(Math.floor(Math.random() * 3));
                        $('#totalFines').text('₹' + Math.floor(Math.random() * 500));
                        $('#attendanceCount').text(Math.floor(Math.random() * 30 + 10));
                    }
                });
            }

            loadStats();

            // Add hover effect to stat cards
            $('.stat-card').hover(
                function() {
                    $(this).addClass('animated pulse');
                },
                function() {
                    $(this).removeClass('animated pulse');
                }
            );

            // Add loading animation to buttons
            $('.dashboard-card a').click(function(e) {
                var btn = $(this);
                var originalText = btn.html();
                btn.html('<i class="fas fa-spinner fa-spin"></i> Loading...');
                btn.prop('disabled', true);
                
                // Simulate loading (remove this in production)
                setTimeout(function() {
                    btn.html(originalText);
                    btn.prop('disabled', false);
                }, 1500);
            });
        });
    </script>
</body>
</html>