<%-- 
    Document   : student_dashboard
    Created on : 27 Aug, 2024, 8:31:00 PM
    Author     : MOHD LARAIB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
  String role = (String) session.getAttribute("role");
    if (role == null || !"Student".equals(role)) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LibraryPro - Student Dashboard</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Source+Serif+Pro:wght@400;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #2563eb;
            --secondary-color: #7c3aed;
            --accent-color: #ef4444;
            --success-color: #10b981;
            --light-color: #f8fafc;
            --dark-color: #1e293b;
            --gray-color: #64748b;
            --light-gray: #e2e8f0;
            --gradient-primary: linear-gradient(135deg, #2563eb 0%, #7c3aed 100%);
            --gradient-secondary: linear-gradient(135deg, #8b5cf6 0%, #3b82f6 100%);
            --shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            --shadow-heavy: 0 20px 40px rgba(0, 0, 0, 0.12);
            --transition: all 0.3s ease;
            --border-radius: 16px;
            --card-radius: 12px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--light-color);
            color: var(--dark-color);
            line-height: 1.6;
            overflow-x: hidden;
            min-height: 100vh;
        }

        /* Modern Header */
        .modern-header {
            background: white;
            padding: 1rem 0;
            box-shadow: var(--shadow);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            height: 80px;
            display: flex;
            align-items: center;
            border-bottom: 1px solid var(--light-gray);
        }

        .header-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .logo-container {
            display: flex;
            align-items: center;
            gap: 1rem;
            text-decoration: none;
            transition: var(--transition);
        }

        .logo-icon {
            background: var(--gradient-primary);
            width: 48px;
            height: 48px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.3);
        }

        .logo-text {
            display: flex;
            flex-direction: column;
        }

        .logo-title {
            font-family: 'Source Serif Pro', serif;
            font-weight: 700;
            font-size: 1.8rem;
            color: var(--dark-color);
            line-height: 1.2;
        }

        .logo-subtitle {
            font-size: 0.75rem;
            color: var(--gray-color);
            font-weight: 500;
            letter-spacing: 0.5px;
            margin-top: 2px;
        }

        /* User Profile */
        .user-profile {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .user-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: var(--gradient-primary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 1.2rem;
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.2);
        }

        .user-info {
            display: flex;
            flex-direction: column;
        }

        .user-name {
            font-weight: 600;
            color: var(--dark-color);
            font-size: 1rem;
        }

        .user-role {
            font-size: 0.8rem;
            color: var(--gray-color);
        }

        /* Modern Menu Toggle */
        .menu-toggle {
            background: white;
            color: var(--primary-color);
            border: 2px solid var(--light-gray);
            width: 48px;
            height: 48px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: var(--transition);
            font-size: 1.25rem;
        }

        .menu-toggle:hover {
            border-color: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.1);
        }

        /* Modern Sidebar */
        .modern-sidebar {
            position: fixed;
            top: 0;
            left: -320px;
            width: 320px;
            height: 100vh;
            background: white;
            z-index: 1100;
            transition: left 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            overflow-y: auto;
            box-shadow: var(--shadow-heavy);
            border-right: 1px solid var(--light-gray);
        }

        .modern-sidebar.open {
            left: 0;
        }

        .sidebar-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(30, 41, 59, 0.8);
            z-index: 1050;
            backdrop-filter: blur(8px);
        }

        .sidebar-overlay.show {
            display: block;
        }

        .sidebar-header {
            padding: 2.5rem 2rem 2rem;
            border-bottom: 1px solid var(--light-gray);
            background: var(--gradient-primary);
            color: white;
        }

        .sidebar-profile {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .sidebar-avatar {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            border: 3px solid white;
            background: var(--gradient-secondary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 1.8rem;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
        }

        .sidebar-user-info h3 {
            font-family: 'Source Serif Pro', serif;
            font-size: 1.5rem;
            margin-bottom: 0.25rem;
        }

        .sidebar-user-info p {
            opacity: 0.9;
            font-size: 0.9rem;
        }

        .sidebar-status {
            display: inline-block;
            background: rgba(255, 255, 255, 0.2);
            padding: 0.25rem 0.75rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .sidebar-menu {
            list-style: none;
            padding: 2rem;
            margin: 0;
        }

        .sidebar-menu li {
            margin-bottom: 0.5rem;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            padding: 1rem 1.25rem;
            color: var(--dark-color);
            text-decoration: none;
            transition: var(--transition);
            border-radius: 10px;
            font-weight: 500;
        }

        .sidebar-menu a:hover {
            background: var(--light-color);
            color: var(--primary-color);
            transform: translateX(5px);
        }

        .sidebar-menu a.active {
            background: var(--gradient-primary);
            color: white;
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.2);
        }

        .sidebar-menu a i {
            width: 24px;
            font-size: 1.1rem;
            margin-right: 1rem;
            color: inherit;
        }

        .sidebar-divider {
            height: 1px;
            background: var(--light-gray);
            margin: 1.5rem 0;
        }

        .sidebar-footer {
            padding: 2rem;
            text-align: center;
            color: var(--gray-color);
            font-size: 0.85rem;
            border-top: 1px solid var(--light-gray);
        }

        /* Main Content */
        .main-content {
            padding-top: 100px;
            padding-bottom: 2rem;
        }

        /* Welcome Card */
        .welcome-card {
            background: white;
            border-radius: var(--border-radius);
            padding: 3rem;
            margin-bottom: 2.5rem;
            box-shadow: var(--shadow);
            border: 1px solid var(--light-gray);
            position: relative;
            overflow: hidden;
        }

        .welcome-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: var(--gradient-primary);
        }

        .welcome-title {
            font-family: 'Source Serif Pro';
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--dark-color);
            margin-bottom: 1rem;
        }

        .welcome-title span {
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .welcome-text {
            color: var(--gray-color);
            font-size: 1.1rem;
            line-height: 1.7;
            margin-bottom: 2rem;
            max-width: 800px;
        }

        /* Dashboard Cards */
        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .dashboard-card {
            background: white;
            border-radius: var(--card-radius);
            padding: 2.5rem;
            box-shadow: var(--shadow);
            border: 1px solid var(--light-gray);
            height: 100%;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            text-align: center;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-heavy);
        }

        .dashboard-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--gradient-primary);
        }

        .card-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: var(--gradient-primary);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            color: white;
            font-size: 2rem;
            box-shadow: 0 8px 24px rgba(37, 99, 235, 0.2);
        }

        .card-title {
            font-family: 'Source Serif Pro', serif;
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--dark-color);
            margin-bottom: 1.25rem;
        }

        .card-content {
            color: var(--gray-color);
            line-height: 1.7;
            margin-bottom: 1.5rem;
        }

        .dashboard-link {
            display: inline-block;
            background: var(--gradient-primary);
            color: white;
            padding: 0.875rem 2rem;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
            border: none;
            cursor: pointer;
            font-size: 1rem;
            font-family: 'Inter', sans-serif;
        }

        .dashboard-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(37, 99, 235, 0.3);
            color: white;
            text-decoration: none;
        }

        /* User Badges */
        .user-badges {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            margin-top: 2rem;
        }

        .user-badge {
            background: var(--light-color);
            color: var(--dark-color);
            padding: 0.75rem 1.5rem;
            border-radius: 50px;
            font-weight: 500;
            font-size: 0.9rem;
            border: 1px solid var(--light-gray);
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition);
        }

        .user-badge:hover {
            background: var(--gradient-primary);
            color: white;
            border-color: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.2);
        }

        .user-badge i {
            font-size: 1rem;
        }

        /* Footer */
        .modern-footer {
            background: var(--dark-color);
            color: white;
            padding: 3rem 0 2rem;
            margin-top: 4rem;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            text-align: center;
        }

        .footer-text {
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 1rem;
            font-size: 0.95rem;
        }

        .copyright {
            color: rgba(255, 255, 255, 0.5);
            font-size: 0.85rem;
            padding-top: 1.5rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
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

        .fade-in {
            animation: fadeInUp 0.8s ease-out;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .modern-sidebar {
                width: 280px;
                left: -280px;
            }
            
            .welcome-title {
                font-size: 2rem;
            }
        }

        @media (max-width: 768px) {
            .header-container {
                padding: 0 1rem;
            }
            
            .logo-title {
                font-size: 1.5rem;
            }
            
            .user-info {
                display: none;
            }
            
            .welcome-card {
                padding: 2rem;
            }
            
            .dashboard-container {
                padding: 0 1rem;
            }
            
            .dashboard-card {
                padding: 2rem;
            }
        }

        @media (max-width: 576px) {
            .menu-toggle {
                width: 40px;
                height: 40px;
                font-size: 1rem;
            }
            
            .logo-icon {
                width: 40px;
                height: 40px;
                font-size: 1.25rem;
            }
            
            .welcome-title {
                font-size: 1.8rem;
            }
            
            .user-badges {
                flex-direction: column;
                align-items: flex-start;
            }
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        ::-webkit-scrollbar-thumb {
            background: var(--primary-color);
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: var(--secondary-color);
        }
    </style>
</head>
<body>
    <!-- Modern Header -->
    <header class="modern-header">
        <div class="header-container">
            <div class="logo-container">
                <div class="logo-icon">
                    <i class="fas fa-book"></i>
                </div>
                <div class="logo-text">
                    <div class="logo-title">Library Hub</div>
                    <div class="logo-subtitle">Student Dashboard</div>
                </div>
            </div>
            <button class="menu-toggle" id="menuToggle">
                <i class="fas fa-bars"></i>
            </button>
        </div>
    </header>

    <!-- Modern Sidebar -->
    <div class="modern-sidebar" id="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-profile">
                <div class="sidebar-avatar">
                    <%= session.getAttribute("username") != null ? 
                        ((String)session.getAttribute("username")).charAt(0) : "U" %>
                </div>
                <div class="sidebar-user-info">
                    <h3><%= session.getAttribute("username") %></h3>
                    <p>Student Account</p>
                    <span class="sidebar-status">
                        <i class="fas fa-circle" style="color: #10b981; font-size: 0.6rem; margin-right: 4px;"></i>
                        Active
                    </span>
                </div>
            </div>
        </div>
        
        <ul class="sidebar-menu">
            <li><a href="#" class="active"><i class="fas fa-home"></i>Dashboard Home</a></li>
            <li><a href="attendance.jsp"><i class="fas fa-calendar-check"></i>Mark Attendance</a></li>
            <li><a href="search_book.jsp"><i class="fas fa-search"></i>Search Books</a></li>
            <li><a href="feedback.jsp"><i class="fas fa-comment-dots"></i>Give Feedback</a></li>
            <li><a href="viewallfines.jsp"><i class="fas fa-money-check-alt"></i>View Fines</a></li>
            
            <div class="sidebar-divider"></div>
            
            <li><a href="borrowed_books.jsp"><i class="fas fa-book-reader"></i>Borrowed Books</a></li>
            <li><a href="profile.jsp"><i class="fas fa-user-cog"></i>My Profile</a></li>
            <li><a href="#"><i class="fas fa-history"></i>Borrowing History</a></li>
            <li><a href="#"><i class="fas fa-bell"></i>Notifications</a></li>
            
            <div class="sidebar-divider"></div>
            
            <li><a href="Logout" style="color: var(--accent-color);">
                <i class="fas fa-sign-out-alt"></i>Logout
            </a></li>
        </ul>
        
        <div class="sidebar-footer">
            <p>© <span id="sidebarYear"></span> Library Management System</p>
            <p>Sacred Heart Degree College</p>
        </div>
    </div>

    <!-- Sidebar Overlay -->
    <div class="sidebar-overlay" id="sidebarOverlay"></div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="dashboard-container">
            <!-- Welcome Section -->
            <div class="welcome-card fade-in">
                <h1 class="welcome-title"><%= session.getAttribute("username") %>!</h1>
                <p class="welcome-text">
                    Welcome to your student dashboard. Here you can manage your library activities, 
                    search for books, mark attendance, view fines, and access all the resources 
                    available to you as a student of Sacred Heart Degree College.
                </p>
            </div>

            <!-- Dashboard Cards Grid -->
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="dashboard-card fade-in">
                        <div class="card-icon">
                            <i class="fas fa-calendar-check"></i>
                        </div>
                        <h3 class="card-title">Mark Attendance</h3>
                        <p class="card-content">
                            Record your library visit attendance. Regular attendance helps track your study patterns.
                        </p>
                        <a href="attendance.jsp" class="dashboard-link">
                            <i class="fas fa-arrow-right mr-2"></i> Mark Attendance
                        </a>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="dashboard-card fade-in">
                        <div class="card-icon">
                            <i class="fas fa-search"></i>
                        </div>
                        <h3 class="card-title">Search Books</h3>
                        <p class="card-content">
                            Browse our extensive collection of books, journals, and digital resources.
                        </p>
                        <a href="search_book.jsp" class="dashboard-link">
                            <i class="fas fa-arrow-right mr-2"></i> Search Books
                        </a>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="dashboard-card fade-in">
                        <div class="card-icon">
                            <i class="fas fa-comment-dots"></i>
                        </div>
                        <h3 class="card-title">Give Feedback</h3>
                        <p class="card-content">
                            Share your suggestions and feedback to help us improve library services.
                        </p>
                        <a href="feedback.jsp" class="dashboard-link">
                            <i class="fas fa-arrow-right mr-2"></i> Give Feedback
                        </a>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="dashboard-card fade-in">
                        <div class="card-icon">
                            <i class="fas fa-money-check-alt"></i>
                        </div>
                        <h3 class="card-title">View Fines</h3>
                        <p class="card-content">
                            Manage all pending fines for late returns or other charges.
                        </p>
                        <a href="viewallfines.jsp" class="dashboard-link">
                            <i class="fas fa-arrow-right mr-2"></i> View Fines
                        </a>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="dashboard-card fade-in">
                        <div class="card-icon">
                            <i class="fas fa-book-reader"></i>
                        </div>
                        <h3 class="card-title">Borrowed Books</h3>
                        <p class="card-content">
                            View currently borrowed books and their due dates.
                        </p>
                        <a href="borrowed_books.jsp" class="dashboard-link">
                            <i class="fas fa-arrow-right mr-2"></i> View Borrowed Books
                        </a>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="dashboard-card fade-in">
                        <div class="card-icon">
                            <i class="fas fa-user-cog"></i>
                        </div>
                        <h3 class="card-title">My Profile</h3>
                        <p class="card-content">
                            Update your personal information and account settings.
                        </p>
                        <a href="profile.jsp" class="dashboard-link">
                            <i class="fas fa-arrow-right mr-2"></i> Manage Profile
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modern Footer -->
    <footer class="modern-footer">
        <div class="footer-content">
            <p class="footer-text">
                Library Management System • Sacred Heart Degree College • Sitapur, Uttar Pradesh
            </p>
            <p class="footer-text">
                Need help? Contact: <a href="mailto:library@shdc.edu.in" style="color: var(--primary-color);">library@shdc.edu.in</a> • 
                Phone: +91 (05862) 221234
            </p>
            <p class="copyright">
                © <span id="currentYear"></span> Library Management System. All rights reserved.
            </p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Set current year
        document.getElementById('currentYear').textContent = new Date().getFullYear();
        document.getElementById('sidebarYear').textContent = new Date().getFullYear();

        // Sidebar functionality
        const sidebar = document.getElementById('sidebar');
        const menuToggle = document.getElementById('menuToggle');
        const sidebarOverlay = document.getElementById('sidebarOverlay');

        // Toggle sidebar
        menuToggle.addEventListener('click', function() {
            sidebar.classList.toggle('open');
            sidebarOverlay.classList.toggle('show');
            
            // Change icon
            const icon = this.querySelector('i');
            if (sidebar.classList.contains('open')) {
                icon.classList.remove('fa-bars');
                icon.classList.add('fa-times');
                this.style.transform = 'rotate(180deg)';
            } else {
                icon.classList.remove('fa-times');
                icon.classList.add('fa-bars');
                this.style.transform = 'rotate(0deg)';
            }
        });

        // Close sidebar when clicking overlay
        sidebarOverlay.addEventListener('click', function() {
            sidebar.classList.remove('open');
            this.classList.remove('show');
            
            // Reset button
            const icon = menuToggle.querySelector('i');
            icon.classList.remove('fa-times');
            icon.classList.add('fa-bars');
            menuToggle.style.transform = 'rotate(0deg)';
        });

        // Close sidebar when clicking a link on mobile
        if (window.innerWidth < 992) {
            const sidebarLinks = document.querySelectorAll('.sidebar-menu a');
            sidebarLinks.forEach(link => {
                link.addEventListener('click', function() {
                    if (!this.classList.contains('logout-btn')) {
                        sidebar.classList.remove('open');
                        sidebarOverlay.classList.remove('show');
                        
                        // Reset button
                        const icon = menuToggle.querySelector('i');
                        icon.classList.remove('fa-times');
                        icon.classList.add('fa-bars');
                        menuToggle.style.transform = 'rotate(0deg)';
                    }
                });
            });
        }

        // Active link highlighting
        $(document).ready(function() {
            var currentPage = window.location.pathname.split('/').pop();
            
            // Highlight active link in sidebar
            $('.sidebar-menu a').each(function() {
                var linkPage = $(this).attr('href');
                if (currentPage === linkPage || 
                   (currentPage === '' && linkPage === '#')) {
                    $(this).addClass('active');
                    $('.sidebar-menu a.active').not(this).removeClass('active');
                }
            });

            // Animate elements on scroll
            function checkScroll() {
                $('.fade-in').each(function() {
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

            // Keyboard shortcuts
            $(document).keydown(function(e) {
                // Escape to close sidebar
                if (e.key === 'Escape' && sidebar.classList.contains('open')) {
                    menuToggle.click();
                }
            });

            // Accessibility
            menuToggle.setAttribute('aria-label', 'Toggle navigation menu');
            menuToggle.setAttribute('aria-expanded', 'false');
            
            menuToggle.addEventListener('click', function() {
                const isExpanded = this.getAttribute('aria-expanded') === 'true';
                this.setAttribute('aria-expanded', !isExpanded);
            });
        });

        // Update greeting based on time
        function updateGreeting() {
            const hour = new Date().getHours();
            const welcomeTitle = document.querySelector('.welcome-title');
            let greeting = '';
            
            if (hour < 12) {
                greeting = 'Good morning';
            } else if (hour < 18) {
                greeting = 'Good afternoon';
            } else {
                greeting = 'Good evening';
            }
            
            welcomeTitle.innerHTML = `${greeting}, <span><%= session.getAttribute("username") %></span>!`;
        }

        // Call on page load
        updateGreeting();
    </script>
</body>
</html>