<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="Shortcut Icon" type="image/ico" href="favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Form - Library Management System</title>

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

        /* Feedback Form Container */
        .feedback-section {
            padding: 3rem 0;
            background: white;
            min-height: calc(100vh - 120px);
        }

        .feedback-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: var(--shadow);
            overflow: hidden;
            border: 1px solid #eaeaea;
        }

        .feedback-header {
            background: var(--gradient-primary);
            color: white;
            padding: 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .feedback-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 100%);
        }

        .feedback-header h2 {
            font-family: 'Roboto Slab', serif;
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            position: relative;
            z-index: 1;
        }

        .feedback-header p {
            font-size: 1rem;
            opacity: 0.9;
            margin-bottom: 0;
            position: relative;
            z-index: 1;
        }

        .feedback-body {
            padding: 2.5rem;
        }

        .form-group {
            margin-bottom: 1.8rem;
        }

        .form-label {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            font-size: 1rem;
        }

        .form-label i {
            margin-right: 10px;
            color: var(--secondary-color);
            font-size: 1.1rem;
        }

        .form-control {
            width: 100%;
            padding: 0.8rem 1.2rem;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-family: 'Poppins', sans-serif;
            font-size: 0.95rem;
            transition: var(--transition);
            background: #f8f9fa;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--secondary-color);
            background: white;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }

        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }

        .file-upload {
            position: relative;
            overflow: hidden;
            display: inline-block;
            width: 100%;
        }

        .file-upload-btn {
            background: var(--gradient-secondary);
            color: white;
            padding: 0.8rem 1.5rem;
            border-radius: 10px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: var(--transition);
            font-weight: 500;
            border: none;
            width: 100%;
        }

        .file-upload-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(52, 152, 219, 0.3);
        }

        .file-upload-input {
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
            cursor: pointer;
            width: 100%;
            height: 100%;
        }

        .file-info {
            margin-top: 10px;
            padding: 10px;
            background: #f8f9fa;
            border-radius: 8px;
            border: 1px dashed #ddd;
            display: none;
        }

        .submit-btn {
            background: var(--gradient-secondary);
            color: white;
            border: none;
            padding: 1rem 2.5rem;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1.1rem;
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin: 2rem auto 0;
            min-width: 200px;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(52, 152, 219, 0.4);
        }

        .submit-btn i {
            font-size: 1.2rem;
        }

        .form-note {
            background: #f8f9fa;
            padding: 1rem;
            border-radius: 10px;
            margin-top: 2rem;
            border-left: 4px solid var(--secondary-color);
        }

        .form-note p {
            margin: 0;
            font-size: 0.9rem;
            color: #666;
        }

        .form-note i {
            color: var(--secondary-color);
            margin-right: 8px;
        }

        /* Footer */
        .footer {
            background: linear-gradient(135deg, #1a2530 0%, #2c3e50 100%);
            color: white;
            padding: 3rem 0 2rem 0;
            position: relative;
            z-index: 10;
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
            
            .feedback-header {
                padding: 1.5rem;
            }
            
            .feedback-header h2 {
                font-size: 1.8rem;
            }
            
            .feedback-body {
                padding: 1.5rem;
            }
            
            .submit-btn {
                width: 100%;
                max-width: 300px;
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
            body {
                padding-top: 70px;
                padding-bottom: 45px;
            }
            
            .feedback-container {
                margin: 0 1.5rem;
            }
            
            .copyright {
                height: 45px;
                padding: 0.7rem !important;
            }
        }
    </style>
</head>

<body>
    <!-- Enhanced Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <!-- Brand Logo -->
            <a class="navbar-brand" href="#">
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
                    <li class="nav-item">
                        <a class="nav-link active" href="feedback.html">Feedback</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Feedback Form Section -->
    <section class="feedback-section">
        <div class="container">
            <div class="feedback-container fade-in">
                <div class="feedback-header">
                    <h2>Feedback Form</h2>
                    <p>Share your thoughts and suggestions with us</p>
                </div>
                
                <div class="feedback-body">
                    <form action="FeedbackServlet" method="post" enctype="multipart/form-data" id="feedbackForm">
                        <!-- Name Field -->
                        <div class="form-group">
                            <label for="user_name" class="form-label">
                                <i class="fas fa-user"></i> Name
                            </label>
                            <input type="text" 
                                   id="user_name" 
                                   name="user_name" 
                                   class="form-control" 
                                   placeholder="Enter your full name"
                                   required>
                        </div>

                        <!-- Comment Field -->
                        <div class="form-group">
                            <label for="comment" class="form-label">
                                <i class="fas fa-comment-alt"></i> Comment
                            </label>
                            <textarea id="comment" 
                                     name="comment" 
                                     class="form-control" 
                                     placeholder="Share your feedback, suggestions, or any issues you encountered..."
                                     required></textarea>
                        </div>

                        <!-- Book Image Upload -->
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-image"></i> Book Image
                            </label>
                            <div class="file-upload">
                                <button type="button" class="file-upload-btn">
                                    <i class="fas fa-cloud-upload-alt mr-2"></i>
                                    Choose Book Image
                                </button>
                                <input type="file" 
                                       id="book_image" 
                                       name="book_image" 
                                       class="file-upload-input" 
                                       accept="image/*">
                            </div>
                            <div id="fileInfo" class="file-info">
                                <i class="fas fa-file-image mr-2"></i>
                                <span id="fileName">No file chosen</span>
                            </div>
                        </div>

                        <!-- Form Note -->
                        <div class="form-note">
                            <p><i class="fas fa-info-circle"></i> 
                                Please provide constructive feedback. You can upload images related to books or library facilities.
                                Maximum file size: 5MB. Supported formats: JPG, PNG, GIF.
                            </p>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="submit-btn">
                            <i class="fas fa-paper-plane"></i>
                            Submit Feedback
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Main Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Quick Links</h4>
                    <a href="index.html"><i class="fas fa-chevron-right mr-2"></i>Home</a>
                    <a href="about_us.jsp"><i class="fas fa-chevron-right mr-2"></i>About Us</a>
                    <a href="blog.jsp"><i class="fas fa-chevron-right mr-2"></i>Blog</a>
                    <a href="feedback.html"><i class="fas fa-chevron-right mr-2"></i>Feedback</a>
                    <a href="contact.jsp"><i class="fas fa-chevron-right mr-2"></i>Contact</a>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Resources</h4>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>E-Books</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Research Papers</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Journals</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Library Catalog</a>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Contact Info</h4>
                    <div class="contact-info">
                        <p><i class="fas fa-map-marker-alt mr-2"></i> Sacred Heart Degree College<br>Sitapur, Uttar Pradesh</p>
                        <p><i class="fas fa-phone mr-2"></i> +91 9876543210</p>
                        <p><i class="fas fa-envelope mr-2"></i> library@shdc.edu.in</p>
                        <p><i class="fas fa-clock mr-2"></i> Mon-Sat: 8:45 AM - 2:30 PM</p>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>Feedback & Support</h4>
                    <a href="feedback.html"><i class="fas fa-chevron-right mr-2"></i>Submit Feedback</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Help Desk</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>FAQ</a>
                    <a href="#"><i class="fas fa-chevron-right mr-2"></i>Report Issue</a>
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

        // File upload functionality
        $(document).ready(function() {
            // File upload preview
            $('.file-upload-input').change(function() {
                var fileName = $(this).val().split('\\').pop();
                var fileSize = this.files[0].size;
                var maxSize = 5 * 1024 * 1024; // 5MB
                
                if (fileSize > maxSize) {
                    alert('File size exceeds 5MB limit. Please choose a smaller file.');
                    $(this).val('');
                    $('#fileName').text('No file chosen');
                    $('#fileInfo').hide();
                    return;
                }
                
                if (fileName) {
                    $('#fileName').text(fileName + ' (' + formatBytes(fileSize) + ')');
                    $('#fileInfo').show();
                } else {
                    $('#fileName').text('No file chosen');
                    $('#fileInfo').hide();
                }
            });

            // Format file size
            function formatBytes(bytes, decimals = 2) {
                if (bytes === 0) return '0 Bytes';
                const k = 1024;
                const dm = decimals < 0 ? 0 : decimals;
                const sizes = ['Bytes', 'KB', 'MB', 'GB'];
                const i = Math.floor(Math.log(bytes) / Math.log(k));
                return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
            }

            // Form validation
            $('#feedbackForm').submit(function(e) {
                var name = $('#user_name').val().trim();
                var comment = $('#comment').val().trim();
                
                if (!name || !comment) {
                    e.preventDefault();
                    alert('Please fill in all required fields.');
                    return false;
                }
                
                // Optional: Add more validation here
                if (comment.length < 10) {
                    e.preventDefault();
                    alert('Please provide more detailed feedback (at least 10 characters).');
                    return false;
                }
                
                return true;
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
        });
    </script>
</body>
</html>