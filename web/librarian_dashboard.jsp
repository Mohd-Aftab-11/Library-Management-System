<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;

    if (session == null || role == null || !role.equals("Librarian")) {
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
    <title>Librarian Dashboard - Library Management System</title>

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
            border-left: 5px solid var(--secondary-color);
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
            background: var(--gradient-secondary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            font-weight: 600;
            box-shadow: 0 4px 10px rgba(52, 152, 219, 0.3);
        }

        .user-details h3 {
            margin: 0;
            color: var(--primary-color);
            font-weight: 600;
        }

        .user-details .badge {
            background: var(--gradient-success);
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
        .card-icon.students { background: var(--gradient-success); }
        .card-icon.attendance { background: var(--gradient-warning); }
        .card-icon.settings { background: var(--gradient-accent); }

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
        .stat-icon.students { background: var(--gradient-success); }
        .stat-icon.issued { background: var(--gradient-warning); }
        .stat-icon.pending { background: var(--gradient-accent); }

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
            <a class="navbar-brand" href="librarian_dashboard.jsp">
                <div class="brand-icon">
                    <i class="fas fa-book-open fa-lg"></i>
                </div>
                <div>
                    <span class="brand-text">Library Hub</span>
                    <span class="brand-subtext">Librarian Dashboard</span>
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

    <!-- Dashboard Container -->
    <div class="dashboard-container">
        <!-- Welcome Header -->
        <div class="welcome-header">
            <h2>Welcome, <span class="text-gradient"><%= session.getAttribute("username") %></span></h2>
            <p class="text-muted">Role: Librarian | Last Login: Today</p>
            <div class="user-info">
                <div class="user-avatar floating">
                    <%= ((String) session.getAttribute("username")).charAt(0) %>
                </div>
                <div class="user-details">
                    <h3><%= session.getAttribute("username") %></h3>
                    <span class="badge">Librarian</span>
                </div>
            </div>
        </div>

        <!-- Manage Books Section -->
        <div class="dashboard-section">
            <div class="section-header">
                <div class="section-icon">
                    <i class="fas fa-book"></i>
                </div>
                <h3>Manage Books</h3>
            </div>
            <div class="dashboard-grid">
                <div class="dashboard-card">
                    <div class="card-icon books">
                        <i class="fas fa-plus"></i>
                    </div>
                    <h4>Add Book</h4>
                    <p>Add new books to the library collection</p>
                    <a href="add_book.jsp" class="pulse">Add Book</a>
                </div>
                <div class="dashboard-card">
                    <div class="card-icon books">
                        <i class="fas fa-edit"></i>
                    </div>
                    <h4>Update Book</h4>
                    <p>Modify existing book details</p>
                    <a href="update_book.jsp">Update Book</a>
                </div>
                <div class="dashboard-card">
                    <div class="card-icon books">
                        <i class="fas fa-trash"></i>
                    </div>
                    <h4>Delete Book</h4>
                    <p>Remove books from library</p>
                    <a href="delete_book.jsp">Delete Book</a>
                </div>
                <div class="dashboard-card">
                    <div class="card-icon books">
                        <i class="fas fa-search"></i>
                    </div>
                    <h4>Search Books</h4>
                    <p>Find books in the library</p>
                    <a href="search_book.jsp">Search Books</a>
                </div>
            </div>
        </div>

        <!-- Student Management Section -->
        <div class="dashboard-section">
            <div class="section-header">
                <div class="section-icon">
                    <i class="fas fa-users"></i>
                </div>
                <h3>Student Management</h3>
            </div>
            <div class="dashboard-grid">
                <div class="dashboard-card">
                    <div class="card-icon students">
                        <i class="fas fa-user-graduate"></i>
                    </div>
                    <h4>Student List</h4>
                    <p>View all registered students</p>
                    <a href="viewStudents.jsp">View Students</a>
                </div>
                <div class="dashboard-card">
                    <div class="card-icon students">
                        <i class="fas fa-book-open"></i>
                    </div>
                    <h4>Issue Book</h4>
                    <p>Issue books to students</p>
                    <a href="issue_book.jsp">Issue Book</a>
                </div>
                <div class="dashboard-card">
                    <div class="card-icon students">
                        <i class="fas fa-undo"></i>
                    </div>
                    <h4>Return Book</h4>
                    <p>Accept book returns</p>
                    <a href="return_book.jsp">Return Book</a>
                </div>
                <div class="dashboard-card">
                    <div class="card-icon students">
                        <i class="fas fa-search"></i>
                    </div>
                    <h4>Search Returns</h4>
                    <p>Search returned books</p>
                    <a href="search_return_book.jsp">Search Returns</a>
                </div>
            </div>
            <div class="dashboard-grid" style="margin-top: 1rem;">
                <div class="dashboard-card">
                    <div class="card-icon students">
                        <i class="fas fa-bookmark"></i>
                    </div>
                    <h4>Issued Books</h4>
                    <p>Search currently issued books</p>
                    <a href="Search Issued Books.jsp">Search Issued</a>
                </div>
                <div class="dashboard-card">
                    <div class="card-icon students">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <h4>Attendance</h4>
                    <p>Search student attendance</p>
                    <a href="search_attendance.jsp">Search Attendance</a>
                </div>
            </div>
        </div>

        <!-- Attendance Section -->
        <div class="dashboard-section">
            <div class="section-header">
                <div class="section-icon">
                    <i class="fas fa-calendar-alt"></i>
                </div>
                <h3>Attendance Management</h3>
            </div>
            <div class="dashboard-grid">
                <div class="dashboard-card">
                    <div class="card-icon attendance">
                        <i class="fas fa-clipboard-list"></i>
                    </div>
                    <h4>All Attendance</h4>
                    <p>View complete attendance records</p>
                    <a href="view_allattendance.jsp">View Attendance</a>
                </div>
            </div>
        </div>

        <!-- Settings & Feedback Section -->
        <div class="dashboard-section">
            <div class="section-header">
                <div class="section-icon">
                    <i class="fas fa-cog"></i>
                </div>
                <h3>Settings & Feedback</h3>
            </div>
            <div class="dashboard-grid">
                <div class="dashboard-card">
                    <div class="card-icon settings">
                        <i class="fas fa-lock"></i>
                    </div>
                    <h4>Change Password</h4>
                    <p>Update your account password</p>
                    <a href="change_password.jsp">Change Password</a>
                </div>
                <div class="dashboard-card">
                    <div class="card-icon settings">
                        <i class="fas fa-comments"></i>
                    </div>
                    <h4>View Feedback</h4>
                    <p>Check student feedback</p>
                    <a href="viewFeedback.jsp">View Feedback</a>
                </div>
                <div class="dashboard-card">
                    <div class="card-icon settings">
                        <i class="fas fa-money-bill-wave"></i>
                    </div>
                    <h4>Manage Fines</h4>
                    <p>Handle fine payments</p>
                    <a href="viewallfins.jsp">Manage Fines</a>
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
                    <a href="librarian_dashboard.jsp"><i class="fas fa-chevron-right mr-2"></i>Dashboard</a>
                    <a href="add_book.jsp"><i class="fas fa-chevron-right mr-2"></i>Add Book</a>
                    <a href="issue_book.jsp"><i class="fas fa-chevron-right mr-2"></i>Issue Book</a>
                    <a href="viewStudents.jsp"><i class="fas fa-chevron-right mr-2"></i>Student List</a>
                    <a href="change_password.jsp"><i class="fas fa-chevron-right mr-2"></i>Change Password</a>
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
                    <h4>Admin Tools</h4>
                    <a href="view_allattendance.jsp"><i class="fas fa-chevron-right mr-2"></i>Attendance</a>
                    <a href="viewFeedback.jsp"><i class="fas fa-chevron-right mr-2"></i>Feedback</a>
                    <a href="viewallfins.jsp"><i class="fas fa-chevron-right mr-2"></i>Fines</a>
                    <a href="search_book.jsp"><i class="fas fa-chevron-right mr-2"></i>Search Books</a>
                    <a href="Logout"><i class="fas fa-chevron-right mr-2"></i>Logout</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Fixed Copyright Section -->
    <div class="copyright text-center">
        <p>© <span id="currentYear"></span> Library Hub- Sacred Heart Degree College. All rights reserved.</p>
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

            // Update stats with random numbers (for demo)
            setInterval(() => {
                $('.stat-card:nth-child(1) h3').text(Math.floor(Math.random() * 100 + 1200));
                $('.stat-card:nth-child(2) h3').text(Math.floor(Math.random() * 50 + 800));
                $('.stat-card:nth-child(3) h3').text(Math.floor(Math.random() * 20 + 300));
                $('.stat-card:nth-child(4) h3').text(Math.floor(Math.random() * 5 + 10));
            }, 5000);

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
                
                // Simulate loading
                setTimeout(function() {
                    btn.html(originalText);
                    btn.prop('disabled', false);
                }, 1500);
            });
        });
    </script>
</body>
</html>