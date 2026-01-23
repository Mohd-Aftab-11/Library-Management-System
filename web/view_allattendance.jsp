<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBCon"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("role") == null) {
        response.sendRedirect("index.html");
        return;
    }
    
    String role = (String) userSession.getAttribute("role");
    boolean isLibrarian = "Librarian".equals(role);
    
    if (!isLibrarian) {
        response.sendRedirect("student_dashboard.jsp");
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
    <title>Attendance Management - Library Management System</title>

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
            --light-color: #f8f9fa;
            --dark-color: #2c3e50;
            --gradient-primary: linear-gradient(135deg, #2c3e50, #4a6491);
            --gradient-secondary: linear-gradient(135deg, #3498db, #2ecc71);
            --gradient-accent: linear-gradient(135deg, #e74c3c, #f39c12);
            --gradient-warning: linear-gradient(135deg, #f39c12, #e67e22);
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

        /* Main Content Container */
        .content-container {
            padding: 2rem 1rem;
            margin-top: 100px;
            max-width: 1400px;
            margin-left: auto;
            margin-right: auto;
        }

        /* Results Container */
        .results-container {
            background: white;
            padding: 2.5rem;
            border-radius: 20px;
            box-shadow: var(--shadow);
            margin-bottom: 2rem;
            animation: fadeInUp 0.8s ease-out;
        }

        .results-header {
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 2px solid #eee;
        }

        .results-header h2 {
            color: var(--primary-color);
            font-family: 'Roboto Slab', serif;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .results-header .form-icon {
            width: 70px;
            height: 70px;
            background: var(--gradient-secondary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            color: white;
            font-size: 1.5rem;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.2);
        }

        /* Table Styling */
        .table-custom {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
        }

        .table-custom thead th {
            background: var(--gradient-primary);
            color: white;
            border: none;
            padding: 1rem;
            font-weight: 600;
            text-align: center;
            vertical-align: middle;
        }

        .table-custom tbody tr {
            transition: var(--transition);
        }

        .table-custom tbody tr:hover {
            background-color: rgba(52, 152, 219, 0.05);
            transform: translateY(-2px);
        }

        .table-custom tbody td {
            padding: 1rem;
            vertical-align: middle;
            border-color: #eee;
            text-align: center;
        }

        /* Status Badges */
        .status-present {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            padding: 0.4rem 1.2rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            display: inline-block;
            min-width: 100px;
        }

        .status-absent {
            background: linear-gradient(135deg, #e74c3c, #f39c12);
            color: white;
            padding: 0.4rem 1.2rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            display: inline-block;
            min-width: 100px;
        }

        /* Statistics Cards */
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
            text-align: center;
            transition: var(--transition);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-hover);
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            background: var(--gradient-secondary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            color: white;
            font-size: 1.5rem;
        }

        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
        }

        .stat-label {
            color: #666;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
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
            .content-container {
                padding: 1rem;
                margin-top: 80px;
            }

            .results-container {
                padding: 1.5rem;
            }

            .table-custom {
                font-size: 0.9rem;
            }

            .stats-container {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 576px) {
            .table-custom {
                font-size: 0.8rem;
            }

            .status-present,
            .status-absent {
                min-width: 80px;
                font-size: 0.75rem;
                padding: 0.3rem 0.8rem;
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

        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        .btn-custom {
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
            min-width: 150px;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
            text-decoration: none;
        }

        .btn-custom:hover {
            background: var(--gradient-primary);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(52, 152, 219, 0.4);
        }

        .error-message {
            background: linear-gradient(135deg, #e74c3c, #f39c12);
            color: white;
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 2rem;
            text-align: center;
            box-shadow: 0 4px 15px rgba(231, 76, 60, 0.3);
        }
    </style>
</head>

<body>
    <!-- Enhanced Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <!-- Brand Logo -->
            <a class="navbar-brand" href="librarian_dashboard.jsp">
                <div class="brand-icon">
                    <i class="fas fa-book-open fa-lg"></i>
                </div>
                <div>
                    <span class="brand-text">Library Hub</span>
                    <span class="brand-subtext">Attendance Management</span>
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
                        <a class="nav-link active" href="librarian_dashboard.jsp">
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

    <!-- Main Content -->
    <div class="content-container">
        <div class="results-container">
            <div class="results-header">
                <div class="form-icon">
                    <i class="fas fa-clipboard-check"></i>
                </div>
                <h2>Attendance Records</h2>
                <p class="text-muted">View all student attendance records</p>
            </div>

            <%
                int totalRecords = 0;
                int presentCount = 0;
                int absentCount = 0;
                
                try {
                    DBCon db = new DBCon();
                    // Get statistics
                    String statsQuery = "SELECT COUNT(*) as total, " +
                                       "SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) as present, " +
                                       "SUM(CASE WHEN status = 'Absent' THEN 1 ELSE 0 END) as absent " +
                                       "FROM attendance";
                    java.sql.PreparedStatement statsStmt = db.con.prepareStatement(statsQuery);
                    ResultSet statsRs = statsStmt.executeQuery();
                    if (statsRs.next()) {
                        totalRecords = statsRs.getInt("total");
                        presentCount = statsRs.getInt("present");
                        absentCount = statsRs.getInt("absent");
                    }
                    statsRs.close();
                    statsStmt.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>

            <!-- Statistics Cards -->
            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-file-alt"></i>
                    </div>
                    <div class="stat-value"><%= totalRecords %></div>
                    <div class="stat-label">Total Records</div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon" style="background: var(--gradient-success);">
                        <i class="fas fa-user-check"></i>
                    </div>
                    <div class="stat-value"><%= presentCount %></div>
                    <div class="stat-label">Present Students</div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon" style="background: var(--gradient-accent);">
                        <i class="fas fa-user-slash"></i>
                    </div>
                    <div class="stat-value"><%= absentCount %></div>
                    <div class="stat-label">Absent Students</div>
                </div>
            </div>

            <!-- Check if there is an error message -->
            <% if (request.getAttribute("error") != null) { %>
                <div class="error-message">
                    <i class="fas fa-exclamation-triangle mr-2"></i>
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <!-- Attendance Table -->
            <div class="table-responsive">
                <table class="table table-custom">
                    <thead>
                        <tr>
                            <th><i class="fas fa-id-card"></i> Student Roll Number</th>
                            <th><i class="fas fa-calendar-day"></i> Date</th>
                            <th><i class="fas fa-info-circle"></i> Status</th>
                            <th><i class="fas fa-user"></i> Student Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            try {
                                DBCon db = new DBCon();
                                String query = "SELECT student_roll_number, attendance_date, status, student_name FROM attendance ORDER BY attendance_date DESC, student_roll_number";
                                db.pstmt = db.con.prepareStatement(query);
                                ResultSet rs = db.pstmt.executeQuery();
                                
                                while (rs.next()) {
                                    String rollNumber = rs.getString("student_roll_number");
                                    String date = rs.getString("attendance_date");
                                    String status = rs.getString("status");
                                    String name = rs.getString("student_name");
                        %>
                        <tr>
                            <td><strong><%= rollNumber %></strong></td>
                            <td><i class="fas fa-calendar-alt mr-2 text-primary"></i><%= date %></td>
                            <td>
                                <% if ("Present".equalsIgnoreCase(status)) { %>
                                    <span class="status-present"><i class="fas fa-check-circle mr-1"></i> Present</span>
                                <% } else if ("Absent".equalsIgnoreCase(status)) { %>
                                    <span class="status-absent"><i class="fas fa-times-circle mr-1"></i> Absent</span>
                                <% } else { %>
                                    <span class="badge badge-secondary"><%= status %></span>
                                <% } %>
                            </td>
                            <td><i class="fas fa-user-graduate mr-2 text-primary"></i><%= name %></td>
                        </tr>
                        <% 
                                }
                                rs.close();
                                db.pstmt.close();
                                db.con.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                        %>
                        <tr>
                            <td colspan="4" class="text-center text-danger">
                                <i class="fas fa-exclamation-triangle mr-2"></i>
                                Error loading attendance records. Please try again later.
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <!-- Action Buttons -->
            <div class="action-buttons">
                <button class="btn-custom" onclick="window.print()" style="background: var(--gradient-success);">
                    <i class="fas fa-print"></i> Print Attendance
                </button>
            </div>
        </div>
    </div>

    <!-- Main Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Admin Tools</h4>
                    <a href="librarian_dashboard.jsp"><i class="fas fa-chevron-right mr-2"></i>Dashboard</a>
                    <a href="view_allattendance.jsp"><i class="fas fa-chevron-right mr-2"></i>Attendance Records</a>
                    <a href="viewStudents.jsp"><i class="fas fa-chevron-right mr-2"></i>Student Management</a>
                    <a href="viewFeedback.jsp"><i class="fas fa-chevron-right mr-2"></i>Feedback</a>
                    <a href="viewallfins.jsp"><i class="fas fa-chevron-right mr-2"></i>Fines Management</a>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Library Reports</h4>
                    <a href="view_allattendance.jsp"><i class="fas fa-chevron-right mr-2"></i>Attendance Reports</a>
                    <a href="viewallbooks.jsp"><i class="fas fa-chevron-right mr-2"></i>Book Inventory</a>
                    <a href="issue_book.jsp"><i class="fas fa-chevron-right mr-2"></i>Issue Records</a>
                    <a href="return_book.jsp"><i class="fas fa-chevron-right mr-2"></i>Return Records</a>
                    <a href="viewallfins.jsp"><i class="fas fa-chevron-right mr-2"></i>Fine Reports</a>
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
                    <h4>Quick Actions</h4>
                    <div class="quick-links">
                        <a href="librarian_dashboard.jsp"><i class="fas fa-tachometer-alt mr-1"></i> Dashboard</a>
                        <a href="add_book.jsp"><i class="fas fa-plus-circle mr-1"></i> Add Book</a>
                        <a href="search_book.jsp"><i class="fas fa-search mr-1"></i> Search Books</a>
                        <a href="issue_book.jsp"><i class="fas fa-book-reader mr-1"></i> Issue Book</a>
                        <a href="Logout"><i class="fas fa-sign-out-alt mr-1"></i> Logout</a>
                    </div>
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

        // Enhance print functionality
        $(document).ready(function() {
            $('.btn-custom').first().click(function() {
                // Add print styles
                var printContent = $('.results-container').html();
                var originalContent = $('body').html();
                
                $('body').html('<div class="print-container" style="padding: 20px;">' + 
                               '<h2 style="text-align: center; color: #2c3e50;">Attendance Report</h2>' +
                               '<p style="text-align: center; color: #666;">Generated on: ' + new Date().toLocaleDateString() + '</p>' +
                               printContent + 
                               '</div>');
                
                window.print();
                
                // Restore original content
                $('body').html(originalContent);
                location.reload(); // Reload to restore event handlers
            });
        });
    </script>
</body>
</html>