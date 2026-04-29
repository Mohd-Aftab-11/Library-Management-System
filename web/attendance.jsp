<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*" %>

<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;

    if (session == null || role == null || !role.equals("Student")) {
        response.sendRedirect("index.jsp");
        return;
    }
    
    // Get student details from session if available
    String studentName = (String) session.getAttribute("username");
    String studentRollNumber = (String) session.getAttribute("roll_number");
    if (studentRollNumber == null) {
        studentRollNumber = "";
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="Shortcut Icon" type="image/ico" href="favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mark Attendance - Library Management System</title>

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
            max-width: 900px;
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
            border-left: 5px solid var(--warning-color);
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
            background: var(--gradient-warning);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            font-weight: 600;
            box-shadow: 0 4px 10px rgba(243, 156, 18, 0.3);
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

        .stat-icon.checkin { background: var(--gradient-success); }
        .stat-icon.checkout { background: var(--gradient-accent); }
        .stat-icon.total { background: var(--gradient-info); }

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

        /* Form Container */
        .form-container {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: var(--shadow);
            margin-bottom: 2rem;
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
            background: var(--gradient-warning);
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

        .btn-group {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .btn-checkin, .btn-checkout {
            flex: 1;
            padding: 0.8rem 1.5rem;
            border-radius: 10px;
            font-weight: 600;
            font-size: 1rem;
            transition: var(--transition);
            border: none;
            cursor: pointer;
            font-family: 'Poppins', sans-serif;
        }

        .btn-checkin {
            background: var(--gradient-success);
            color: white;
        }

        .btn-checkin:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(39, 174, 96, 0.3);
        }

        .btn-checkout {
            background: var(--gradient-accent);
            color: white;
        }

        .btn-checkout:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(231, 76, 60, 0.3);
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

            .stats-container {
                grid-template-columns: 1fr;
            }

            .btn-group {
                flex-direction: column;
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
                        <a class="nav-link" href="student_dashboard.jsp">
                            <i class="fas fa-tachometer-alt mr-2"></i>Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="attendance.jsp">
                            <i class="fas fa-calendar-check mr-2"></i>Mark Attendance
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
            <h2>Mark Your Attendance</h2>
            <p class="text-muted">Record your daily library visit to track your study patterns</p>
            <div class="user-info">
                <div class="user-avatar floating">
                    <%= studentName != null ? studentName.charAt(0) : 'S' %>
                </div>
                <div class="user-details">
                    <h3><%= studentName %></h3>
                    <span class="badge">Student</span>
                    <p class="text-muted mt-1 mb-0 small">Roll No: <%= studentRollNumber %></p>
                </div>
            </div>
        </div>

        <!-- Attendance Statistics -->
        <div class="stats-container">
            <div class="stat-card">
                <div class="stat-icon checkin">
                    <i class="fas fa-sign-in-alt"></i>
                </div>
                <div class="stat-info">
                    <h3 id="checkinsCount">0</h3>
                    <p>Total Check-ins</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon total">
                    <i class="fas fa-calendar-day"></i>
                </div>
                <div class="stat-info">
                    <h3 id="totalDays">0</h3>
                    <p>Days Present</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon checkout">
                    <i class="fas fa-sign-out-alt"></i>
                </div>
                <div class="stat-info">
                    <h3 id="checkoutsCount">0</h3>
                    <p>Total Check-outs</p>
                </div>
            </div>
        </div>

        <!-- Attendance Form -->
        <div class="form-container">
            <div class="section-header">
                <div class="section-icon">
                    <i class="fas fa-fingerprint"></i>
                </div>
                <h3>Record Attendance</h3>
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

            <form action="AttendanceServlet" method="post" id="attendanceForm">
                <!-- Roll Number (Auto-filled from session) -->
                <div class="form-group">
                    <label for="student_roll_number"><i class="fas fa-id-card"></i> Roll Number</label>
                    <input type="text" id="student_roll_number" name="student_roll_number" 
                           class="form-control" value="<%= studentRollNumber %>" required>
                </div>

                <!-- Student Name (Auto-filled from session) -->
                <div class="form-group">
                    <label for="student_name"><i class="fas fa-user"></i> Student Name</label>
                    <input type="text" id="student_name" name="student_name" 
                           class="form-control" value="<%= studentName %>" required readonly>
                </div>

                <!-- Date (Default to today) -->
                <div class="form-group">
                    <label for="attendance_date"><i class="fas fa-calendar-alt"></i> Date</label>
                    <input type="date" id="attendance_date" name="attendance_date" 
                           class="form-control" required>
                </div>

                <!-- Time Display -->
                <div class="form-group">
                    <label><i class="fas fa-clock"></i> Current Time</label>
                    <div class="form-control" style="background: #f8f9fa; font-size: 1.1rem; font-weight: 500;">
                        <span id="currentTime"></span>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="btn-group">
                    <button type="submit" name="action" value="check_in" class="btn-checkin" id="checkinBtn">
                        <i class="fas fa-sign-in-alt mr-2"></i> Check In
                    </button>
                    <button type="submit" name="action" value="check_out" class="btn-checkout" id="checkoutBtn">
                        <i class="fas fa-sign-out-alt mr-2"></i> Check Out
                    </button>
                </div>
            </form>
        </div>

        <!-- Today's Status Card -->
        <div class="form-container" style="margin-top: 0;">
            <div class="section-header">
                <div class="section-icon" style="background: var(--gradient-info);">
                    <i class="fas fa-chart-line"></i>
                </div>
                <h3>Today's Status</h3>
            </div>
            <div id="todayStatus" class="text-center" style="padding: 1rem;">
                <i class="fas fa-spinner fa-spin fa-2x text-secondary"></i>
                <p class="mt-2">Loading today's status...</p>
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

        // Set today's date as default
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('attendance_date').value = today;

        // Update current time
        function updateTime() {
            const now = new Date();
            const timeString = now.toLocaleTimeString('en-US', { 
                hour: '2-digit', 
                minute: '2-digit', 
                second: '2-digit',
                hour12: true 
            });
            const dateString = now.toLocaleDateString('en-US', { 
                weekday: 'long', 
                year: 'numeric', 
                month: 'long', 
                day: 'numeric' 
            });
            document.getElementById('currentTime').innerHTML = `${dateString}<br><span style="font-size: 1.2rem;">${timeString}</span>`;
        }
        updateTime();
        setInterval(updateTime, 1000);

        // Navbar scroll effect
        $(window).scroll(function() {
            if ($(window).scrollTop() > 30) {
                $('.navbar').addClass('scrolled');
            } else {
                $('.navbar').removeClass('scrolled');
            }
        });

        // Load statistics and today's status
        $(document).ready(function() {
            const rollNumber = $('#student_roll_number').val();
            
            // Load statistics
            function loadStats() {
                // This would be an AJAX call to fetch real attendance data
                // For demo, using localStorage to simulate data
                let checkins = localStorage.getItem('attendance_checkins') || 0;
                let checkouts = localStorage.getItem('attendance_checkouts') || 0;
                
                $('#checkinsCount').text(checkins);
                $('#checkoutsCount').text(checkouts);
                $('#totalDays').text(Math.floor(checkins / 2)); // Assuming each full day has checkin+checkout
            }
            
            // Load today's status
            function loadTodayStatus() {
                const todayDate = document.getElementById('attendance_date').value;
                const checkinKey = `checkin_${rollNumber}_${todayDate}`;
                const checkoutKey = `checkout_${rollNumber}_${todayDate}`;
                
                const checkinTime = localStorage.getItem(checkinKey);
                const checkoutTime = localStorage.getItem(checkoutKey);
                
                let statusHtml = '';
                if (checkinTime && checkoutTime) {
                    statusHtml = `
                        <div class="alert-custom alert-success">
                            <i class="fas fa-check-circle fa-2x mb-2"></i>
                            <h5>You have completed your attendance for today!</h5>
                            <p>Check-in: ${checkinTime} | Check-out: ${checkoutTime}</p>
                        </div>
                    `;
                    $('#checkinBtn').prop('disabled', true);
                    $('#checkoutBtn').prop('disabled', true);
                } else if (checkinTime) {
                    statusHtml = `
                        <div class="alert-custom alert-warning">
                            <i class="fas fa-clock fa-2x mb-2"></i>
                            <h5>You are currently checked in</h5>
                            <p>Check-in time: ${checkinTime}</p>
                            <p>Don't forget to check out before leaving!</p>
                        </div>
                    `;
                    $('#checkinBtn').prop('disabled', true);
                    $('#checkoutBtn').prop('disabled', false);
                } else {
                    statusHtml = `
                        <div class="alert-custom alert-info" style="background: #e8f4fd; border-left-color: var(--info-color);">
                            <i class="fas fa-info-circle fa-2x mb-2" style="color: var(--info-color);"></i>
                            <h5>You haven't checked in today</h5>
                            <p>Please check in to record your library visit.</p>
                        </div>
                    `;
                    $('#checkinBtn').prop('disabled', false);
                    $('#checkoutBtn').prop('disabled', true);
                }
                
                $('#todayStatus').html(statusHtml);
            }
            
            // Handle form submission
            $('#attendanceForm').on('submit', function(e) {
                const action = $('button[type="submit"]:focus').val();
                const rollNumber = $('#student_roll_number').val();
                const studentName = $('#student_name').val();
                const date = $('#attendance_date').val();
                const currentTime = new Date().toLocaleTimeString();
                
                if (action === 'check_in') {
                    const checkinKey = `checkin_${rollNumber}_${date}`;
                    if (!localStorage.getItem(checkinKey)) {
                        localStorage.setItem(checkinKey, currentTime);
                        
                        // Update statistics
                        let checkins = parseInt(localStorage.getItem('attendance_checkins') || 0);
                        localStorage.setItem('attendance_checkins', checkins + 1);
                        
                        showMessage('success', 'Check-in successful! Time recorded: ' + currentTime);
                    } else {
                        showMessage('warning', 'You have already checked in today!');
                        e.preventDefault();
                        return false;
                    }
                } else if (action === 'check_out') {
                    const checkinKey = `checkin_${rollNumber}_${date}`;
                    const checkoutKey = `checkout_${rollNumber}_${date}`;
                    
                    if (localStorage