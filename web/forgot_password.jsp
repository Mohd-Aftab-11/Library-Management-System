<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="Shortcut Icon" type="image/ico" href="favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - Library Management System</title>

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
            --shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: var(--light-color);
            color: #333;
            line-height: 1.6;
            padding-top: 70px;
            overflow-x: hidden;
            min-height: 100vh;
            position: relative;
            padding-bottom: 50px;
        }

        /* Reduced Navbar Height */
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

        /* Navbar hover effect */
        .nav-link {
            color: white !important;
            font-weight: 500;
            padding: 0.4rem 1rem !important;
            margin: 0 0.3rem;
            border-radius: 20px;
            transition: background-color 0.3s, color 0.3s;
            position: relative;
            font-size: 0.9rem;
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

        /* Registration Tooltip */
        .registration {
            position: relative;
        }

        .registration-tooltip {
            display: none;
            position: absolute;
            top: 100%;
            right: 0;
            background: white;
            border-radius: 12px;
            padding: 1rem;
            width: 260px;
            box-shadow: var(--shadow);
            z-index: 1000;
            opacity: 0;
            transform: translateY(10px);
            transition: opacity 0.3s, transform 0.3s;
            border: 1px solid #eee;
        }

        .registration:hover .registration-tooltip {
            display: block;
            opacity: 1;
            transform: translateY(5px);
        }

        .registration-tooltip::before {
            content: '';
            position: absolute;
            top: -8px;
            right: 20px;
            width: 16px;
            height: 16px;
            background: white;
            transform: rotate(45deg);
            border-left: 1px solid #eee;
            border-top: 1px solid #eee;
        }

        .tooltip-header {
            background: var(--gradient-primary);
            color: white;
            padding: 0.6rem;
            border-radius: 8px;
            margin-bottom: 0.8rem;
            text-align: center;
            font-weight: 600;
            font-size: 0.9rem;
        }

        .tooltip-link {
            display: block;
            padding: 0.6rem;
            margin: 0.3rem 0;
            background: #f8f9fa;
            border-radius: 6px;
            color: var(--dark-color);
            text-decoration: none;
            transition: var(--transition);
            border-left: 4px solid transparent;
            font-size: 0.85rem;
        }

        .tooltip-link:hover {
            background: var(--light-color);
            color: var(--secondary-color);
            border-left: 4px solid var(--secondary-color);
            transform: translateX(5px);
        }

        /* Forgot Password Container */
        .forgot-password-container {
            margin: 80px auto 40px;
            max-width: 500px;
            animation: fadeInUp 0.8s ease-out;
        }

        .password-card {
            background: white;
            border-radius: 15px;
            box-shadow: var(--shadow);
            overflow: hidden;
            transition: var(--transition);
            border: none;
        }

        .password-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .password-header {
            background: var(--gradient-primary);
            color: white;
            padding: 1.2rem;
            text-align: center;
            font-size: 1.4rem;
            font-weight: 600;
            font-family: 'Roboto Slab', serif;
            border-bottom: 3px solid var(--secondary-color);
        }

        .password-body {
            padding: 2rem;
        }

        .form-label {
            color: var(--primary-color);
            font-weight: 500;
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
        }

        .form-control {
            border-radius: 8px;
            border: 2px solid #e1e5e9;
            padding: 0.75rem 1rem;
            font-size: 0.95rem;
            transition: var(--transition);
            font-family: 'Poppins', sans-serif;
        }

        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            outline: none;
        }

        .btn-password {
            background: var(--gradient-secondary);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: var(--transition);
            font-family: 'Poppins', sans-serif;
            width: 100%;
            margin-top: 1rem;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
        }

        .btn-password:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(52, 152, 219, 0.4);
        }

        .btn-back {
            background: var(--light-color);
            color: var(--primary-color);
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            padding: 0.75rem 2rem;
            font-weight: 500;
            font-size: 0.95rem;
            cursor: pointer;
            transition: var(--transition);
            font-family: 'Poppins', sans-serif;
            width: 100%;
            margin-top: 0.5rem;
        }

        .btn-back:hover {
            background: #f0f0f0;
            border-color: var(--secondary-color);
            color: var(--secondary-color);
        }

        .password-help {
            text-align: center;
            margin-top: 1.5rem;
            color: #666;
            font-size: 0.9rem;
        }

        .password-help a {
            color: var(--secondary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .password-help a:hover {
            text-decoration: underline;
        }

        .alert-message {
            padding: 0.75rem 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
            font-size: 0.9rem;
            display: none;
        }

        .alert-success {
            background: rgba(39, 174, 96, 0.1);
            color: var(--success-color);
            border: 1px solid rgba(39, 174, 96, 0.2);
        }

        .alert-error {
            background: rgba(231, 76, 60, 0.1);
            color: var(--accent-color);
            border: 1px solid rgba(231, 76, 60, 0.2);
        }

        /* Animation for page load */
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

        /* Main Footer - NOT fixed */
        .footer {
            background: linear-gradient(135deg, #1a2530 0%, #2c3e50 100%);
            color: white;
            padding: 3rem 0 2rem 0;
            position: relative;
            z-index: 10;
            margin-top: 60px;
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

        /* Fixed Copyright Section Only */
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
            color: rgba(255, 255, 255, 0.8);
        }

        /* Responsive Design */
        @media (max-width: 767px) {
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
            
            .navbar {
                padding: 0.3rem 1rem;
                min-height: 60px;
                height: 60px;
            }
            
            .navbar-collapse {
                background: var(--gradient-primary);
                padding: 0.8rem;
                border-radius: 0 0 15px 15px;
                margin-top: 0.3rem;
                box-shadow: 0 10px 20px rgba(0,0,0,0.1);
                order: 4;
                width: 100%;
            }
            
            .nav-link {
                text-align: center;
                margin: 0.2rem 0;
                padding: 0.4rem !important;
                width: 100%;
            }
            
            .forgot-password-container {
                margin: 60px 15px 30px;
                padding: 0 10px;
            }
            
            .password-body {
                padding: 1.5rem;
            }
            
            .copyright {
                height: 40px;
                padding: 0.6rem !important;
            }
            
            .copyright p {
                font-size: 0.75rem;
            }
        }

        @media (min-width: 768px) and (max-width: 991px) {
            .forgot-password-container {
                max-width: 450px;
                margin: 70px auto 35px;
            }
            
            .copyright {
                height: 45px;
                padding: 0.7rem !important;
            }
        }
    </style>
</head>

<body>
    <!-- Enhanced Navbar with reduced height -->
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
                    <li class="nav-item registration">
                        <a class="nav-link registration-btn" href="registration.jsp">
                            <i class="fas fa-user-plus mr-2"></i>Student Registration
                        </a>
                        <div class="registration-tooltip">
                            <div class="tooltip-header">
                                <i class="fas fa-graduation-cap mr-2"></i>Student Portal
                            </div>
                            <a href="Registration.jsp" class="tooltip-link">
                                <i class="fas fa-user-edit mr-2"></i>Register Here
                            </a>
                            <a href="timetable.jsp" class="tooltip-link">
                                <i class="fas fa-calendar-alt mr-2"></i>See Time Table
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Forgot Password Form Section -->
    <div class="container forgot-password-container fade-in">
        <div class="password-card">
            <div class="password-header">
                <i class="fas fa-key mr-2"></i>Forgot Password
            </div>
            <div class="password-body">
                <div id="successMessage" class="alert-message alert-success" style="display: none;">
                    <i class="fas fa-check-circle mr-2"></i>Password has been sent to your email.
                </div>
                <div id="errorMessage" class="alert-message alert-error" style="display: none;">
                    <i class="fas fa-exclamation-circle mr-2"></i>Invalid username or email. Make sure your email matches your registered email.
                </div>
                
                <form id="forgotPasswordForm" action="ForgotPasswordServlet21" method="post">
                    <div class="form-group">
                        <label for="username" class="form-label">
                            <i class="fas fa-user mr-1"></i>Username:
                        </label>
                        <input type="text" id="username" name="username" 
                               class="form-control" placeholder="Enter your username" required>
                        <small class="form-text text-muted">Enter your registered username</small>
                    </div>
                    
                    <div class="form-group">
                        <label for="email" class="form-label">
                            <i class="fas fa-envelope mr-1"></i>Email Address:
                        </label>
                        <input type="email" id="email" name="email" 
                               class="form-control" placeholder="Enter your email address" required>
                        <small class="form-text text-muted">Enter the email associated with your account</small>
                    </div>
                    
                    <button type="submit" class="btn-password">
                        <i class="fas fa-paper-plane mr-2"></i>Send Password
                    </button>
                    
                    <a href="index.html" class="btn btn-back">
                        <i class="fas fa-arrow-left mr-2"></i>Back to Login
                    </a>
                </form>
                
                <div class="password-help">
                    <p>Need help? <a href="mailto:library@shdc.edu.in">Contact Library Support</a></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Footer (not fixed) -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Quick Links</h4>
                    <a href="index.html"><i class="fas fa-chevron-right mr-2"></i>Home</a>
                    <a href="about_us.jsp"><i class="fas fa-chevron-right mr-2"></i>About Us</a>
                    <a href="blog.jsp"><i class="fas fa-chevron-right mr-2"></i>Blog</a>
                    <a href="registration.jsp"><i class="fas fa-chevron-right mr-2"></i>Student Registration</a>
                    <a href="timetable.jsp"><i class="fas fa-chevron-right mr-2"></i>Time Table</a>
                    <a href="forgot_password.jsp" class="active"><i class="fas fa-chevron-right mr-2"></i>Forgot Password</a>
                    <div class="quick-links">
                        <a href="#">FAQ</a>
                        <a href="#">Help Desk</a>
                        <a href="#">Tutorials</a>
                        <a href="#">Sitemap</a>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Resources</h4>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>E-Books</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Research Papers</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Journals</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Magazines</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Newspapers</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Digital Archives</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Library Catalog</a>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Contact Info</h4>
                    <div class="contact-info">
                        <p><i class="fas fa-map-marker-alt mr-2"></i> Sacred Heart Degree College<br>Sitapur, Uttar Pradesh</p>
                        <p><i class="fas fa-phone mr-2"></i> +91 9876543210</p>
                        <p><i class="fas fa-envelope mr-2"></i> library@shdc.edu.in</p>
                        <p><i class="fas fa-clock mr-2"></i> Mon-Sat: 8:45 AM - 2:30 PM</p>
                        <p><i class="fas fa-globe mr-2"></i> www.shdclibrary.edu.in</p>
                    </div>
                    <div class="social-links">
                        <a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" title="Twitter"><i class="fab fa-twitter"></i></a>
                        <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
                        <a href="#" title="YouTube"><i class="fab fa-youtube"></i></a>
                        <a href="#" title="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>College Info</h4>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Academic Calendar</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Examination Schedule</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Faculty Directory</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Administration</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Campus Facilities</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Alumni Network</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Careers</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Fixed Copyright Section Only -->
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
            // Highlight current page in nav
            $('.nav-link[href="forgot_password.jsp"]').addClass('active');
            
            // Mobile menu close on click
            $('.navbar-nav .nav-link').click(function() {
                if ($(window).width() < 992) {
                    $('.navbar-collapse').collapse('hide');
                }
            });

            // Form submission handling
            $('#forgotPasswordForm').on('submit', function(e) {
                e.preventDefault();
                
                var username = $('#username').val().trim();
                var email = $('#email').val().trim();
                
                // Hide previous messages
                $('#successMessage').hide();
                $('#errorMessage').hide();
                
                // Basic validation
                if (!username || !email) {
                    $('#errorMessage').text('Please fill in all fields').show();
                    return false;
                }
                
                // Email validation
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    $('#errorMessage').text('Please enter a valid email address').show();
                    return false;
                }
                
                // Submit form via AJAX for better UX
                $.ajax({
                    url: 'ForgotPasswordServlet21',
                    type: 'POST',
                    data: $(this).serialize(),
                    success: function(response) {
                        if (response.includes('Password has been sent')) {
                            $('#successMessage').show();
                            $('#errorMessage').hide();
                            $('#forgotPasswordForm')[0].reset();
                        } else {
                            $('#errorMessage').text(response).show();
                            $('#successMessage').hide();
                        }
                    },
                    error: function() {
                        $('#errorMessage').text('An error occurred. Please try again.').show();
                        $('#successMessage').hide();
                    }
                });
                
                return false;
            });

            // Tooltip for mobile
            $(window).resize(function() {
                if ($(window).width() <= 991) {
                    $('.registration-tooltip').css('display', 'block');
                } else {
                    $('.registration-tooltip').css('display', 'none');
                }
            });
        });
    </script>
</body>
</html>