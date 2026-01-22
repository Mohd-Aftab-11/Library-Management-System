<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="Shortcut Icon" type="image/ico" href="favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog - Library Management System</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom CSS -->
    <style>
        body {
            padding-top: 56px;
        }

        .blog-header {
            background-color: #452066;
            color: #fff;
            padding: 20px 0;
        }

        .blog-content {
            margin: 20px auto;
            max-width: 800px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .blog-content h2 {
            color: #452066;
        }

        .blog-content p {
            font-size: 18px;
            line-height: 1.6;
        }

        .footer {
            background-color: black;
            color: white;
            padding: 20px 0;
        }

        .footer a {
            color: white;
            text-decoration: none;
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

    <!-- Blog Header -->
    <header class="blog-header text-center">
        <h1>Blog - Library Management System</h1>
    </header>

    <!-- Blog Content -->
    <div class="blog-content">
        <h2>Security and Access Control</h2>
        <p>
            Yes, the Library Management System is secure and provides role-based access control. Only authorized
            users, such as librarians and students, can access the system functionalities relevant to their roles.
        </p>

        <h2>What is the Library Management System?</h2>
        <p>
            The Library Management System is designed to streamline the process of managing a library's inventory,
            including books and student information. It allows librarians to add, update, and search for books, as
            well as track issues and returns. Students can also view their issued books and return details through
            the system.
        </p>

        <h2>How does the book issue and return process work?</h2>
        <p>
            The system enables librarians to issue books to students by recording details like the book ID and
            student roll number. When a book is returned, the system automatically updates the return date and
            changes the status to "book returned" without deleting the record.
        </p>

       
    </div>

    <!-- Footer Section -->
    <footer class="footer text-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <h4>About</h4>
                    <ul class="list-unstyled">
                        <li><a href="#">Library Management System</a></li>
                        <li><a href="#">Join Our Team</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <h4>Support</h4>
                    <ul class="list-unstyled">
                        <li><a href="#">Help / FAQ</a></li>
                        <li><a href="#">Accessibility</a></li>
                        <li><a href="#">Publisher</a></li>
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
