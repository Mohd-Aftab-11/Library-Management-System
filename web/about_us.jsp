<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="Shortcut Icon" type="image/ico" href="favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Library Management System</title>

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
            --gradient-accent: linear-gradient(135deg, #f97316 0%, #ef4444 100%);
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

        .sidebar-header h3 {
            font-family: 'Source Serif Pro', serif;
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }

        .sidebar-header p {
            opacity: 0.9;
            font-size: 0.95rem;
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

        /* Main Content */
        .main-content {
            padding-top: 100px;
            min-height: calc(100vh - 300px);
        }

        /* About Hero Section */
        .about-hero {
            background: var(--gradient-primary);
            color: white;
            padding: 5rem 0;
            margin-bottom: 4rem;
            position: relative;
            overflow: hidden;
        }

        .about-hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            opacity: 0.1;
        }

        .hero-badge {
            display: inline-block;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            color: white;
            padding: 0.5rem 1.5rem;
            border-radius: 50px;
            font-size: 0.875rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .section-title {
            font-family: 'Source Serif Pro', serif;
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }

        .section-subtitle {
            font-size: 1.25rem;
            opacity: 0.9;
            max-width: 800px;
            margin: 0 auto;
        }

        /* About Content */
        .about-content {
            padding: 4rem 0;
        }

        .about-card {
            background: white;
            border-radius: var(--card-radius);
            padding: 3rem;
            box-shadow: var(--shadow);
            border: 1px solid var(--light-gray);
            margin-bottom: 3rem;
            transition: var(--transition);
        }

        .about-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-heavy);
        }

        .about-card h2 {
            font-family: 'Source Serif Pro', serif;
            font-size: 2rem;
            margin-bottom: 2rem;
            color: var(--dark-color);
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .about-card h2 i {
            color: var(--primary-color);
        }

        .about-card p {
            color: var(--gray-color);
            line-height: 1.8;
            margin-bottom: 1.5rem;
            font-size: 1.1rem;
        }

        .developer-profile {
            display: flex;
            align-items: center;
            gap: 2rem;
            background: var(--light-color);
            padding: 2rem;
            border-radius: var(--card-radius);
            margin: 2rem 0;
            border: 1px solid var(--light-gray);
        }

        .developer-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: var(--gradient-primary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 3rem;
            font-weight: bold;
        }

        .developer-info h3 {
            font-family: 'Source Serif Pro', serif;
            font-size: 1.75rem;
            margin-bottom: 0.5rem;
        }

        .developer-role {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .skills-list {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-top: 1rem;
        }

        .skill-tag {
            background: var(--light-color);
            color: var(--dark-color);
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-size: 0.875rem;
            font-weight: 500;
            border: 1px solid var(--light-gray);
        }

        .skill-tag:hover {
            background: var(--gradient-primary);
            color: white;
            transform: translateY(-2px);
        }

        /* Features Section */
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .feature-card {
            background: white;
            border-radius: var(--card-radius);
            padding: 2.5rem;
            box-shadow: var(--shadow);
            border: 1px solid var(--light-gray);
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: var(--shadow-heavy);
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--gradient-primary);
        }

        .feature-icon {
            width: 64px;
            height: 64px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
            font-size: 1.75rem;
            color: white;
            background: var(--gradient-primary);
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.2);
        }

        .feature-title {
            font-family: 'Source Serif Pro', serif;
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--dark-color);
        }

        .feature-description {
            color: var(--gray-color);
            line-height: 1.7;
        }

        /* Modern Footer */
        .modern-footer {
            background: var(--dark-color);
            color: white;
            padding: 4rem 0 2rem;
            position: relative;
            margin-top: 4rem;
        }

        .footer-top {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 3rem;
            margin-bottom: 3rem;
        }

        .footer-column h4 {
            font-family: 'Source Serif Pro', serif;
            font-size: 1.25rem;
            margin-bottom: 1.5rem;
            color: white;
            position: relative;
            padding-bottom: 0.75rem;
        }

        .footer-column h4::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 40px;
            height: 3px;
            background: var(--gradient-primary);
            border-radius: 2px;
        }

        .footer-links {
            list-style: none;
            padding: 0;
        }

        .footer-links li {
            margin-bottom: 0.75rem;
        }

        .footer-links a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .footer-links a:hover {
            color: white;
            transform: translateX(5px);
        }

        .contact-info {
            margin-top: 1.5rem;
        }

        .contact-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 1rem;
            color: rgba(255, 255, 255, 0.8);
        }

        .contact-item i {
            color: var(--primary-color);
            margin-right: 0.75rem;
            margin-top: 0.25rem;
        }

        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .social-link {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-decoration: none;
            transition: var(--transition);
        }

        .social-link:hover {
            background: var(--primary-color);
            transform: translateY(-3px);
        }

        .footer-bottom {
            padding-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            text-align: center;
            color: rgba(255, 255, 255, 0.6);
            font-size: 0.9rem;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .footer-top {
                grid-template-columns: repeat(2, 1fr);
            }
            
            .section-title {
                font-size: 2.5rem;
            }
            
            .about-card {
                padding: 2rem;
            }
        }

        @media (max-width: 768px) {
            .header-container {
                padding: 0 1rem;
            }
            
            .section-title {
                font-size: 2rem;
            }
            
            .developer-profile {
                flex-direction: column;
                text-align: center;
            }
            
            .modern-sidebar {
                width: 280px;
                left: -280px;
            }
            
            .main-content {
                padding-top: 90px;
            }
        }

        @media (max-width: 576px) {
            .logo-title {
                font-size: 1.5rem;
            }
            
            .logo-icon {
                width: 40px;
                height: 40px;
                font-size: 1.25rem;
            }
            
            .about-hero {
                padding: 3rem 0;
            }
            
            .features-grid {
                grid-template-columns: 1fr;
            }
            
            .footer-top {
                grid-template-columns: 1fr;
            }
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
                <div class="logo-icon">
                    <i class="fas fa-book"></i>
                </div>
                <div class="logo-text">
                    <div class="logo-title">Library Hub</div>
                    <div class="logo-subtitle">Sacred Heart Degree College</div>
                </div>
            
            <button class="menu-toggle" id="menuToggle">
                <i class="fas fa-bars"></i>
            </button>
        </div>
    </header>

    <!-- Modern Sidebar -->
    <div class="modern-sidebar" id="sidebar">
        <div class="sidebar-header">
            <h3><i class="fas fa-compass mr-2"></i>Navigation</h3>
            <p>Explore our library resources</p>
        </div>
        
        <ul class="sidebar-menu">
            <li><a href="index.html"><i class="fas fa-home"></i>Home</a></li>
            <li><a href="about_us.jsp" class="active"><i class="fas fa-university"></i>About Us</a></li>
            <li><a href="blog.jsp"><i class="fas fa-newspaper"></i>Blog & News</a></li>
            <li><a href="timetable.jsp"><i class="fas fa-calendar-alt"></i>Academic Schedule</a></li>
            <li><a href="forgot_password.jsp"><i class="fas fa-key"></i>Password Recovery</a></li>
            
            <div class="sidebar-divider"></div>
            
            <li><a href="#"><i class="fas fa-book-open"></i>Digital Library</a></li>
            <li><a href="#"><i class="fas fa-file-alt"></i>Research Papers</a></li>
            <li><a href="#"><i class="fas fa-journal-whills"></i>Academic Journals</a></li>
            <li><a href="#"><i class="fas fa-bookmark"></i>Magazines</a></li>
            <li><a href="#"><i class="fas fa-archive"></i>Archives</a></li>
            
            <div class="sidebar-divider"></div>
            
            <li><a href="registration.jsp"><i class="fas fa-user-plus"></i>Student Registration</a></li>
            <li><a href="login.jsp"><i class="fas fa-sign-in-alt"></i>Login Portal</a></li>
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
        <!-- About Hero Section -->
        <section class="about-hero">
            <div class="container">
                <div class="text-center fade-in">
                    <span class="hero-badge">
                        <i class="fas fa-info-circle mr-2"></i>About Our System
                    </span>
                    <h1 class="section-title">About Library Management System</h1>
                    <p class="section-subtitle">
                        Dedicated to providing efficient and user-friendly solutions for managing library resources 
                        and enhancing academic excellence through technology.
                    </p>
                </div>
            </div>
        </section>

        <!-- About Content -->
        <section class="about-content">
            <div class="container">
                <!-- About System Card -->
                <div class="about-card fade-in">
                    <h2><i class="fas fa-info-circle"></i> About Our System</h2>
                    <p>
                        Welcome to the Library Management System! We are dedicated to providing an efficient and user-friendly
                        solution for managing library resources and student information. Our system aims to streamline the
                        process of book management, tracking issues and returns, and maintaining student records.
                    </p>
                    <p>
                        Our mission is to bridge the gap between traditional library systems and modern technology, 
                        creating a seamless experience for both librarians and students. We believe in empowering 
                        educational institutions with tools that enhance learning and research capabilities.
                    </p>
                </div>

                <!-- Developer Profile Card -->
                <div class="about-card fade-in">
                    <h2><i class="fas fa-code"></i> Our Developer</h2>
                    <div class="developer-profile">
                        <div class="developer-avatar">
                            ML
                        </div>
                        <div class="developer-info">
                            <h3>Mohd Aftab</h3>
                            <div class="developer-role">Full Stack Web Developer</div>
                            <p>
                                Passionate about creating efficient web solutions with expertise in modern web technologies. 
                                Committed to building systems that make a difference in educational environments.
                            </p>
                            <div class="skills-list">
                                <span class="skill-tag">HTML/CSS</span>
                                <span class="skill-tag">Java</span>
                                <span class="skill-tag">JavaScript</span>
                                <span class="skill-tag">JSP/Servlets</span>
                                <span class="skill-tag">Bootstrap</span>
                                <span class="skill-tag">Database Design</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Features Section -->
                <div class="about-card fade-in">
                    <h2><i class="fas fa-star"></i> Key Features</h2>
                    <p>
                        Our Library Management System is packed with powerful features designed to enhance library 
                        operations and user experience. Here are the key capabilities that set our system apart:
                    </p>
                    
                    <div class="features-grid">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-book"></i>
                            </div>
                            <h3 class="feature-title">Book Management</h3>
                            <p class="feature-description">
                                Comprehensive book cataloging system with add, update, delete, and search capabilities. 
                                Manage book details, categories, and availability in real-time.
                            </p>
                        </div>
                        
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-exchange-alt"></i>
                            </div>
                            <h3 class="feature-title">Issue Tracking</h3>
                            <p class="feature-description">
                                Advanced tracking system for book issues and returns with automated notifications 
                                and fine calculation for overdue items.
                            </p>
                        </div>
                        
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-shield-alt"></i>
                            </div>
                            <h3 class="feature-title">Role-Based Access</h3>
                            <p class="feature-description">
                                Secure multi-level access control with different functionalities for librarians, 
                                students, faculty, and administrators.
                            </p>
                        </div>
                        
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-search"></i>
                            </div>
                            <h3 class="feature-title">Advanced Search</h3>
                            <p class="feature-description">
                                Powerful search functionality with filters, sorting options, and quick access to 
                                book availability and location information.
                            </p>
                        </div>
                        
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-chart-bar"></i>
                            </div>
                            <h3 class="feature-title">Analytics Dashboard</h3>
                            <p class="feature-description">
                                Comprehensive reporting and analytics with visual charts for library usage, 
                                popular books, and user statistics.
                            </p>
                        </div>
                        
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-user-friends"></i>
                            </div>
                            <h3 class="feature-title">Student Management</h3>
                            <p class="feature-description">
                                Complete student profile management with issue history, current loans, and 
                                personal information updates.
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Mission Statement -->
                <div class="about-card fade-in">
                    <h2><i class="fas fa-bullseye"></i> Our Mission</h2>
                    <p>
                        Our team is committed to enhancing the user experience by continually improving our system and
                        addressing any feedback or issues promptly. We believe in the power of technology to transform 
                        educational institutions and create better learning environments.
                    </p>
                    <p>
                        We strive to make library management efficient, accessible, and intuitive for everyone involved. 
                        By reducing administrative overhead, we enable librarians to focus more on assisting students 
                        and faculty with their research needs.
                    </p>
                    <p>
                        We hope you find our Library Management System valuable and efficient for managing your library 
                        operations. Our commitment to excellence drives us to constantly evolve and adapt to the changing 
                        needs of educational institutions.
                    </p>
                </div>
            </div>
        </section>

        <!-- Modern Footer -->
        <footer class="modern-footer">
            <div class="container">
                <div class="footer-top">
                    <div class="footer-column">
                        <h4>Quick Access</h4>
                        <ul class="footer-links">
                            <li><a href="index.html"><i class="fas fa-chevron-right"></i> Home</a></li>
                            <li><a href="about_us.jsp"><i class="fas fa-chevron-right"></i> About Us</a></li>
                            <li><a href="blog.jsp"><i class="fas fa-chevron-right"></i> Academic Blog</a></li>
                            <li><a href="registration.jsp"><i class="fas fa-chevron-right"></i> Registration</a></li>
                            <li><a href="timetable.jsp"><i class="fas fa-chevron-right"></i> Schedule</a></li>
                            <li><a href="forgot_password.jsp"><i class="fas fa-chevron-right"></i> Password Help</a></li>
                        </ul>
                    </div>
                    
                    <div class="footer-column">
                        <h4>Resources</h4>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Digital Library</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Research Papers</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Academic Journals</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Magazines</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Newspapers</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Archives</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Catalog Search</a></li>
                        </ul>
                    </div>
                    
                    <div class="footer-column">
                        <h4>Contact</h4>
                        <div class="contact-info">
                            <div class="contact-item">
                                <i class="fas fa-map-marker-alt"></i>
                                <span>Sacred Heart Degree College<br>Sitapur, Uttar Pradesh 261001</span>
                            </div>
                            <div class="contact-item">
                                <i class="fas fa-phone"></i>
                                <span>+91 (05862) 221234</span>
                            </div>
                            <div class="contact-item">
                                <i class="fas fa-envelope"></i>
                                <span>library@shdc.edu.in</span>
                            </div>
                            <div class="contact-item">
                                <i class="fas fa-clock"></i>
                                <span>Mon-Sat: 8:45 AM - 2:30 PM</span>
                            </div>
                        </div>
                        <div class="social-links">
                            <a href="#" class="social-link" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="social-link" title="Twitter"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="social-link" title="Instagram"><i class="fab fa-instagram"></i></a>
                            <a href="#" class="social-link" title="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#" class="social-link" title="YouTube"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                    
                    <div class="footer-column">
                        <h4>Institution</h4>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Academic Calendar</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Examination Schedule</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Faculty Directory</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Administration</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Campus Facilities</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Alumni Network</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Careers</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="footer-bottom">
                    <p>© <span id="currentYear"></span> Library Management System | Sacred Heart Degree College | All Rights Reserved</p>
                </div>
            </div>
        </footer>
    </div>

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
                    sidebar.classList.remove('open');
                    sidebarOverlay.classList.remove('show');
                    
                    // Reset button
                    const icon = menuToggle.querySelector('i');
                    icon.classList.remove('fa-times');
                    icon.classList.add('fa-bars');
                    menuToggle.style.transform = 'rotate(0deg)';
                });
            });
        }

        // Active link highlighting
        $(document).ready(function() {
            var currentPage = window.location.pathname.split('/').pop();
            
            // Highlight active link in sidebar
            $('.sidebar-menu a').each(function() {
                var linkPage = $(this).attr('href');
                if (currentPage === linkPage) {
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
        });
    </script>
</body>
</html>