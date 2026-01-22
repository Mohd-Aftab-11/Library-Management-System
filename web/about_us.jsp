<%-- 
    Document   : about_us
    Created on : 31 Aug, 2024, 10:18:49 PM
    Author     : MOHD LARAIB
--%>

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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <!-- Custom CSS -->
    <style>
        .navbar-nav .nav-link:hover {
            color: #d45248;
            text-decoration: underline;
        }

        .footer a:hover {
            color: #d45248;
            text-decoration: underline;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: auto;
        }

        .section-title {
            font-size: 36px;
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .content {
            font-size: 18px;
            line-height: 1.6;
        }

        .footer {
            background-color: black;
            color: white;
            padding: 20px;
            margin-top: 20px;
        }

        .footer h4 {
            margin-bottom: 10px;
        }

        .footer a {
            color: white;
        }

        .footer a:hover {
            color: #d45248;
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <!-- NavBar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #452066;">
        <a class="navbar-brand" href="#" style="font-size: 28px;">
            <span style="color:#d45248;font-family:Montserrat;font-weight: bold;">
                <div class="fa fa-globe fa-45"></div>Online <span style="color:#fff;">Library</span>
            </span>
        </a>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.html">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="about_us.jsp">About Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Student Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="blog.jsp">Blog</a>
            </li>
        </ul>
    </nav>

    <!-- About Us Section -->
    <div class="container pt-4 mt-5">
        <h1 class="section-title text-center">About Us</h1>
        <div class="content">
            <p>
                Welcome to the Library Management System! We are dedicated to providing an efficient and user-friendly
                solution for managing library resources and student information. Our system aims to streamline the
                process of book management, tracking issues and returns, and maintaining student records.
            </p>
            <p>
                <strong>Our Developer:</strong><br>
                Name: Mohd Laraib<br>
                Role: Web Developer<br>
                Expertise: HTML, CSS, JavaScript, JSP, and Servlets
            </p>
            <p>
                <strong>Key Features of Our System:</strong><br>
                - Book Management: Add, update, and search for books.<br>
                - Issue Tracking: Record book issues and returns.<br>
                - Role-Based Access: Different functionalities for librarians and students.<br>
                - Secure Access: Ensures authorized access to system functionalities based on user roles.
            </p>
            <p>
                Our team is committed to enhancing the user experience by continually improving our system and
                addressing any feedback or issues promptly. We hope you find our Library Management System valuable and
                efficient for managing your library operations.
            </p>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="footer text-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <h4>About</h4>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white">Library Management System</a></li>
                        <li><a href="#" class="text-white">Join Our Team</a></li>
                        <li><a href="#" class="text-white">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <h4>Support</h4>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white">Help / FAQ</a></li>
                        <li><a href="#" class="text-white">Accessibility</a></li>
                        <li><a href="#" class="text-white">Publisher</a></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <h4>Download</h4>
                    <ul class="list-unstyled">
                        <li><a href="#"><img class="app-store"
                                    src="https://www.scribd.com/webpack/assets/images/shared/app_store/app_store_black_en.c01025ef.svg"
                                    alt="appstore"></a></li>
                        <li><a href="#"><img
                                    src="https://www.scribd.com/webpack/assets/images/shared/app_store/play_store_en.52ebe950.svg"
                                    alt="google playstore"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <!-- JS File -->
    <script src="script.js"></script>
</body>

</html>
