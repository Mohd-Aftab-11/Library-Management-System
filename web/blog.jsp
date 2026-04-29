<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="Shortcut Icon" type="image/ico" href="favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog - Library Management System</title>

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
            min-height: 350px;
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

        /* Blog Container */
        .blog-container {
            max-width: 1200px;
            margin: 0 auto 3rem auto;
            animation: fadeInUp 0.8s ease-out;
        }

        .blog-card {
            background: white;
            border-radius: 20px;
            box-shadow: var(--shadow-hover);
            overflow: hidden;
            transition: var(--transition);
            margin-bottom: 2rem;
        }

        .blog-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
        }

        .card-header-custom {
            background: var(--gradient-primary);
            color: white;
            padding: 1.5rem;
            text-align: center;
            border-bottom: 3px solid var(--secondary-color);
        }

        .card-header-custom h2 {
            font-family: 'Roboto Slab', serif;
            font-weight: 700;
            margin: 0;
            font-size: 1.8rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 1rem;
        }

        .card-header-custom .header-icon {
            font-size: 2rem;
            color: white;
        }

        .card-body-custom {
            padding: 2rem;
        }

        .blog-content {
            padding: 1rem 0;
        }

        .blog-content h3 {
            color: var(--primary-color);
            font-family: 'Roboto Slab', serif;
            font-size: 1.5rem;
            margin-bottom: 1rem;
            margin-top: 1.5rem;
        }

        .blog-content h3:first-of-type {
            margin-top: 0;
        }

        .blog-content p {
            color: #555;
            line-height: 1.8;
            margin-bottom: 1rem;
            font-size: 1rem;
        }

        .blog-content ul {
            margin-bottom: 1rem;
            padding-left: 1.5rem;
        }

        .blog-content li {
            color: #555;
            line-height: 1.8;
            margin-bottom: 0.5rem;
        }

        .feature-list {
            list-style: none;
            padding: 0;
        }

        .feature-list li {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            margin-bottom: 0.8rem;
            color: #555;
        }

        .feature-list i {
            color: var(--secondary-color);
            font-size: 1.1rem;
        }

        .blog-meta {
            display: flex;
            gap: 1.5rem;
            margin-bottom: 1rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #e0e0e0;
            color: #888;
            font-size: 0.85rem;
        }

        .blog-meta i {
            margin-right: 0.3rem;
            color: var(--secondary-color);
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

        .fade-in {
            animation: fadeInUp 0.8s ease-out;
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
            
            .card-body-custom {
                padding: 1.5rem;
            }
            
            .blog-container {
                padding: 0 15px;
            }
        }

        @media (max-width: 576px) {
            .hero-title {
                font-size: 1.5rem;
            }
            
            .card-header-custom h2 {
                font-size: 1.5rem;
            }
            
            .blog-meta {
                flex-direction: column;
                gap: 0.5rem;
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
                        <a class="nav-link active" href="blog.jsp">Blog</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Registration.jsp">Registration</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="timetable.jsp">Timetable</a>
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
                <h1 class="hero-title">Library Blog & Updates</h1>
                <p class="hero-subtitle">Stay informed about the latest features, security updates, and insights about our Library Management System.</p>
            </div>
        </div>
    </section>

    <!-- Blog Content -->
    <div class="blog-container">
        <!-- Security Blog Post -->
        <div class="blog-card fade-in">
            <div class="card-header-custom">
                <h2>
                    <i class="fas fa-shield-alt header-icon"></i>
                    Security and Access Control
                </h2>
            </div>
            <div class="card-body-custom">
                <div class="blog-meta">
                    <span><i class="fas fa-calendar-alt"></i> January 15, 2024</span>
                    <span><i class="fas fa-user"></i> Admin Team</span>
                    <span><i class="fas fa-tag"></i> Security, Access Control</span>
                </div>
                <div class="blog-content">
                    <p>
                        Yes, the Library Management System is secure and provides role-based access control. Only authorized
                        users, such as librarians and students, can access the system functionalities relevant to their roles.
                    </p>
                    <p>
                        Our security features include:
                    </p>
                    <ul class="feature-list">
                        <li><i class="fas fa-check-circle"></i> Encrypted password storage</li>
                        <li><i class="fas fa-check-circle"></i> Session management with automatic timeout</li>
                        <li><i class="fas fa-check-circle"></i> Role-based permission system</li>
                        <li><i class="fas fa-check-circle"></i> Audit logs for all critical operations</li>
                        <li><i class="fas fa-check-circle"></i> Secure data transmission with HTTPS</li>
                    </ul>
                    <p>
                        Regular security audits and updates ensure that your data remains protected at all times.
                    </p>
                </div>
            </div>
        </div>

        <!-- System Overview Blog Post -->
        <div class="blog-card fade-in">
            <div class="card-header-custom">
                <h2>
                    <i class="fas fa-info-circle header-icon"></i>
                    What is the Library Management System?
                </h2>
            </div>
            <div class="card-body-custom">
                <div class="blog-meta">
                    <span><i class="fas fa-calendar-alt"></i> January 10, 2024</span>
                    <span><i class="fas fa-user"></i> Admin Team</span>
                    <span><i class="fas fa-tag"></i> Overview, Features</span>
                </div>
                <div class="blog-content">
                    <p>
                        The Library Management System is designed to streamline the process of managing a library's inventory,
                        including books and student information. It allows librarians to add, update, and search for books, as
                        well as track issues and returns. Students can also view their issued books and return details through
                        the system.
                    </p>
                    <p>
                        Key capabilities include:
                    </p>
                    <ul class="feature-list">
                        <li><i class="fas fa-check-circle"></i> Complete book catalog management</li>
                        <li><i class="fas fa-check-circle"></i> Real-time availability tracking</li>
                        <li><i class="fas fa-check-circle"></i> Automated fine calculation</li>
                        <li><i class="fas fa-check-circle"></i> Search and filter functionality</li>
                        <li><i class="fas fa-check-circle"></i> Report generation and analytics</li>
                    </ul>
                    <p>
                        Our system is built with modern web technologies to ensure fast, reliable, and user-friendly experience.
                    </p>
                </div>
            </div>
        </div>

        <!-- Book Management Process Blog Post -->
        <div class="blog-card fade-in">
            <div class="card-header-custom">
                <h2>
                    <i class="fas fa-book header-icon"></i>
                    How does the book issue and return process work?
                </h2>
            </div>
            <div class="card-body-custom">
                <div class="blog-meta">
                    <span><i class="fas fa-calendar-alt"></i> January 5, 2024</span>
                    <span><i class="fas fa-user"></i> Admin Team</span>
                    <span><i class="fas fa-tag"></i> Book Management, Process</span>
                </div>
                <div class="blog-content">
                    <p>
                        The system enables librarians to issue books to students by recording details like the book ID and
                        student roll number. When a book is returned, the system automatically updates the return date and
                        changes the status to "book returned" without deleting the record.
                    </p>
                    <p>
                        Step-by-step process:
                    </p>
                    <ul class="feature-list">
                        <li><i class="fas fa-check-circle"></i> <strong>Issue Process:</strong> Librarian scans/enters book ID and student roll number ? System checks availability ? Book issued with due date</li>
                        <li><i class="fas fa-check-circle"></i> <strong>Return Process:</strong> Librarian scans returned book ? System calculates any overdue fines ? Updates status to "Returned"</li>
                        <li><i class="fas fa-check-circle"></i> <strong>Student View:</strong> Students can view their borrowed books and return dates in their dashboard</li>
                    </ul>
                    <p>
                        This streamlined process reduces manual errors and saves time for both librarians and students.
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

        // Smooth scroll for anchor links
        $('a[href^="#"]').on('click', function(e) {
            if (this.hash !== "") {
                e.preventDefault();
                const hash = this.hash;
                $('html, body').animate({
                    scrollTop: $(hash).offset().top - 80
                }, 800);
            }
        });
    </script>
</body>
</html>