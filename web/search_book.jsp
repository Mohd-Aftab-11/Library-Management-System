<%@ page import="java.sql.*, DB.DBCon" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("role") == null) {
        response.sendRedirect("index.html");
        return;
    }
    
    String role = (String) userSession.getAttribute("role");
    boolean isLibrarian = "Librarian".equals(role);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="Shortcut Icon" type="image/ico" href="favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Book - Library Management System</title>

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
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }

        /* Form Container */
        .form-container {
            background: white;
            padding: 2.5rem;
            border-radius: 20px;
            box-shadow: var(--shadow);
            margin-bottom: 2rem;
            animation: fadeInUp 0.8s ease-out;
        }

        .form-header {
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 2px solid #eee;
        }

        .form-header h2 {
            color: var(--primary-color);
            font-family: 'Roboto Slab', serif;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .form-header .form-icon {
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

        /* Form Styling */
        .form-label {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-label i {
            color: var(--secondary-color);
            width: 20px;
        }

        .form-control {
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            transition: var(--transition);
        }

        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            transform: translateY(-2px);
        }

        /* Button Styling */
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
        }

        .btn-custom:hover {
            background: var(--gradient-primary);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(52, 152, 219, 0.4);
        }

        .btn-secondary {
            background: var(--gradient-warning);
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
        }

        .btn-secondary:hover {
            background: var(--gradient-primary);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(52, 152, 219, 0.4);
        }

        .button-group {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        /* Search Results Table */
        .results-container {
            background: white;
            padding: 2rem;
            border-radius: 20px;
            box-shadow: var(--shadow);
            margin-top: 2rem;
            animation: fadeInUp 0.8s ease-out;
        }

        .results-header {
            text-align: center;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #eee;
        }

        .results-header h3 {
            color: var(--primary-color);
            font-family: 'Roboto Slab', serif;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .book-image {
            width: 80px;
            height: 120px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: var(--transition);
        }

        .book-image:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }

        .table-custom {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .table-custom thead th {
            background: var(--gradient-primary);
            color: white;
            border: none;
            padding: 1rem;
            font-weight: 600;
            text-align: center;
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

        .status-available {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            padding: 0.3rem 1rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        .status-unavailable {
            background: linear-gradient(135deg, #e74c3c, #f39c12);
            color: white;
            padding: 0.3rem 1rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        /* Alert Styling */
        .alert-custom {
            background: linear-gradient(135deg, #fff3cd 0%, #ffeaa7 100%);
            border: none;
            border-left: 5px solid var(--warning-color);
            border-radius: 10px;
            padding: 1.5rem;
            margin-top: 1.5rem;
            animation: fadeInUp 0.5s ease-out;
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

            .form-container, .results-container {
                padding: 1.5rem;
            }

            .button-group {
                flex-direction: column;
                align-items: center;
            }

            .btn-custom, .btn-secondary {
                width: 100%;
                max-width: 300px;
            }

            .table-custom {
                font-size: 0.9rem;
            }

            .book-image {
                width: 60px;
                height: 90px;
            }
        }

        @media (max-width: 576px) {
            .table-custom {
                font-size: 0.8rem;
            }

            .book-image {
                width: 50px;
                height: 75px;
            }

            .status-available,
            .status-unavailable {
                font-size: 0.75rem;
                padding: 0.2rem 0.8rem;
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

        .required::after {
            content: " *";
            color: var(--accent-color);
        }
    </style>
</head>

<body>
    <!-- Enhanced Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <!-- Brand Logo -->
            <a class="navbar-brand" href="<%= isLibrarian ? "librarian_dashboard.jsp" : "student_dashboard.jsp" %>">
                <div class="brand-icon">
                    <i class="fas fa-book-open fa-lg"></i>
                </div>
                <div>
                    <span class="brand-text">Library Hub</span>
                    <span class="brand-subtext">Search Books</span>
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
                        <a class="nav-link active" href="<%= isLibrarian ? "librarian_dashboard.jsp" : "student_dashboard.jsp" %>">
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
        <!-- Search Form Container -->
        <div class="form-container">
            <div class="form-header">
                <div class="form-icon">
                    <i class="fas fa-search"></i>
                </div>
                <h2>Search Books in Library</h2>
                <p class="text-muted">Enter book title to search from the library collection</p>
            </div>

            <form action="SearchBookServlet" method="post" id="searchBookForm">
                <div class="form-group">
                    <label for="book_title" class="form-label required">
                        <i class="fas fa-heading"></i>Book Title
                    </label>
                    <input type="text" class="form-control" id="book_title" name="book_title" required 
                           placeholder="Enter book title or keywords (e.g., 'Java Programming', 'History')">
                    <small class="form-text text-muted">
                        <i class="fas fa-info-circle mr-1"></i>
                        You can search by full title or partial keywords. Search is case-insensitive.
                    </small>
                </div>

                <div class="button-group">
                    <button type="submit" class="btn-custom" id="searchBtn">
                        <i class="fas fa-search"></i> Search Books
                    </button>
                    <a href="<%= isLibrarian ? "librarian_dashboard.jsp" : "student_dashboard.jsp" %>" class="btn-secondary">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </a>
                </div>
            </form>
        </div>

        <!-- Message Display Area -->
        <%
            String message = request.getParameter("message");
            if (message != null && !message.isEmpty()) {
        %>
            <div class="alert alert-custom fade show" role="alert">
                <div class="d-flex align-items-center">
                    <i class="fas fa-info-circle fa-lg mr-3" style="color: var(--warning-color);"></i>
                    <div>
                        <h5 class="alert-heading mb-1">Search Results</h5>
                        <p class="mb-0"><%= message %></p>
                    </div>
                </div>
            </div>
        <% } %>
    </div>

    <!-- Main Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Quick Links</h4>
                    <a href="<%= isLibrarian ? "librarian_dashboard.jsp" : "student_dashboard.jsp" %>">
                        <i class="fas fa-chevron-right mr-2"></i>Dashboard
                    </a>
                    <a href="search_book.jsp">
                        <i class="fas fa-chevron-right mr-2"></i>Search Books
                    </a>
                    <% if (isLibrarian) { %>
                    <a href="add_book.jsp">
                        <i class="fas fa-chevron-right mr-2"></i>Add Book
                    </a>
                    <a href="delete_book.jsp">
                        <i class="fas fa-chevron-right mr-2"></i>Delete Book
                    </a>
                    <% } else { %>
                    <a href="borrowed_books.jsp">
                        <i class="fas fa-chevron-right mr-2"></i>My Books
                    </a>
                    <a href="request_book.jsp">
                        <i class="fas fa-chevron-right mr-2"></i>Request Book
                    </a>
                    <% } %>
                    <a href="change_password.jsp">
                        <i class="fas fa-chevron-right mr-2"></i>Change Password
                    </a>
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
                    <h4>Library Services</h4>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Book Reservation</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Renew Books</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Library Rules</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Fine Structure</a>
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

        // Form validation
        $(document).ready(function() {
            $('#searchBookForm').submit(function(e) {
                const bookTitle = $('#book_title').val().trim();
                
                if (!bookTitle) {
                    e.preventDefault();
                    alert('Please enter a book title to search');
                    $('#book_title').focus();
                    return false;
                }
                
                // Show loading state
                const searchBtn = $('#searchBtn');
                const originalText = searchBtn.html();
                searchBtn.html('<i class="fas fa-spinner fa-spin"></i> Searching...');
                searchBtn.prop('disabled', true);
                
                // Re-enable button after 2 seconds (in case of error)
                setTimeout(() => {
                    searchBtn.html(originalText);
                    searchBtn.prop('disabled', false);
                }, 2000);
            });

            // Mobile menu close on click
            $('.navbar-nav .nav-link').click(function() {
                if ($(window).width() < 992) {
                    $('.navbar-collapse').collapse('hide');
                }
            });

            // Auto-focus on search input
            $('#book_title').focus();
        });
    </script>
</body>
</html>