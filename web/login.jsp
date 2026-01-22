<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="Shortcut Icon" type="image/ico" href="favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <style>
        /* Navbar hover effect */
        .navbar-nav .nav-link {
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
        }

        .navbar-nav .nav-link:hover {
            background-color: skyblue; /* Purple background on hover */
            color: white;
            text-decoration: none;
        }

        /* Background Image Animation */
        

        /* Enhanced Login Form */
        .login-container {
        max-width: 400px;
            margin: 150px auto;
/*            background: rgba(106, 13, 173, 0.9); */
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 4px 25px rgba(0, 0, 0, 0.9);
            transition: transform 0.3s;
/*            background-image: linear-gradient(olivedrab,burlywood);*/
background-color:lightblue;


        }

        .login-container:hover {
            transform: translateY(-10px);
            box-shadow: 0px 8px 30px rgba(0, 0, 0, 0.9);
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: white;
            font-weight: bold;
        }

        .login-container input,
        .login-container select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .login-container input:focus,
        .login-container select:focus {
            border-color: #6a0dad;
            box-shadow: 0px 0px 8px rgba(106, 13, 173, 0.5);
            outline: none;
        }

        .login-container input[type="submit"] {
            background-color: #6a0dad; /* Purple */
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .login-container input[type="submit"]:hover {
            background-color:green; /* Orange on hover */
            transform: scale(1.05);
        }

        footer.footer {
            background-color: black;
            padding: 20px;
            color: white;
            text-align: center;
            margin-top: 50px;
        }

        .footer h4 {
            margin-bottom: 15px;
        }

        .footer a {
            color: white;
        }

        .footer a:hover {
            color: #ff6347; /* Orange color on hover */
            text-decoration: underline;
        }
        .cl{
            color:blueviolet;
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #452066;">
        <a class="navbar-brand" href="#" style="font-size: 28px;">
            <span style="color:#ff6347;font-weight: bold;">
                <i class="fa fa-globe"></i> Library <span style="color:#fff;">Management System</span>
            </span>
        </a>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="about_us.jsp">About Us</a></li>
            <li class="nav-item"><a class="nav-link" href="login.jsp">Student Login</a></li>
            <li class="nav-item"><a class="nav-link" href="blog.jsp">Blog</a></li>
        </ul>
    </nav>

    <!-- Animated Background -->
    <div class="img"></div>

    <!-- Login Form -->
    <div class="login-container">
        <h2 class="cl">Login </h2>
        <form action="LoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="Student">Student</option>
            </select>


            <input type="submit" value="Login">
                            <a href="Registration.jsp"> New Registration?</a></</p>
                            <a href="forgot_password.jsp"> Forget Password?</a></</p>

            <div class="error-message" id="error-message" style="display:none;">Invalid username or password.</div>
        </form>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="row">
            <div class="col-lg-4">
                <h4>About</h4>
                <a href="#">Library Management System</a><br>
                <a href="#">Join Our Team</a><br>
                <a href="#">Contact Us</a>
            </div>
            <div class="col-lg-4">
                <h4>Support</h4>
                <a href="#">Help / FAQ</a><br>
                <a href="#">Accessibility</a><br>
                <a href="#">Publisher</a>
            </div>
            <div class="col-lg-4">
                <h4>Download</h4>
                <img src="aa.png" alt="App Store" width="150"><br>
                <img src="aa.png" alt="Play Store" width="150">
            </div>
        </div>
    </footer>
</body>

</html>
