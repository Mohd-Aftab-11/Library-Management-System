<%-- 
    Document   : student_dashboard
    Created on : 27 Aug, 2024, 8:31:00 PM
    Author     : MOHD LARAIB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%

  String role = (String) session.getAttribute("role");
    if (role == null || !"Student".equals(role)) {
        response.sendRedirect("index.jsp"); // Redirect to login page if role is not Student
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LibraryPro - Student Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }
        .header {
            background-color: #452066;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .dashboard-links {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
            margin: 20px auto;
            width: 80%;
        }
        .dashboard-links a {
            display: block;
            margin: 10px 0;
            color: #452066;
            text-decoration: none;
            font-size: 18px;
        }
        .dashboard-links a:hover {
            color: #d45248;
            text-decoration: underline;
        }
        .footer {
            background-color: #452066;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
        .profile-img {
            width: 100px;
            border-radius: 50%;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome to Your Dashboard, <%= session.getAttribute("username") %>!</h1>
    </div>

    <div class="container">
        <div class="dashboard-links text-center">
            <img src="https://via.placeholder.com/100" alt="Student Profile" class="profile-img">
            <h2>Student Dashboard</h2>
            <a href="attendance.jsp">Mark Attendance</a>
            
          <a class="nav-link" href="search_book.jsp">Search Books</a>
                    <a class="nav-link" href="feedback.jsp">Give Feedback</a>
                    <a class="nav-link" href="viewallfines.jsp">View Fines</a>

            
            <a href="Logout">Logout</a>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2024 LibraryPro. All rights reserved.</p>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
