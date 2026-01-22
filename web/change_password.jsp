<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    String role = (String) session.getAttribute("role");

    if (session == null || role == null) {
        response.sendRedirect("index.jsp"); // Redirect to login page if session is invalid
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LibraryPro - Change Password</title>
    <style>
        /* General Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
             /* Gradient background */
            color: #fff;
            min-height: 100vh;
        }

        .header {
            background-color: brown;
            color: #fff;
            padding: 2px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        .change-password-container {
            background: #fff; /* White card background */
            color: #333; /* Dark text for readability */
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            margin: 50px auto;
            max-width: 400px;
            padding: 30px;
            text-align: center;
        }

        .change-password-container h2 {
            color: #2a5298; /* Match the background gradient */
            margin-bottom: 20px;
        }

        input[type="text"], input[type="password"] {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 12px 15px;
            width: calc(100% - 30px);
            margin-bottom: 20px;
            font-size: 14px;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #2a5298;
            box-shadow: 0 0 8px rgba(42, 82, 152, 0.5);
            outline: none;
        }

        input[type="submit"] {
            background: linear-gradient(to right, #1e3c72, #2a5298); /* Gradient button */
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            transition: transform 0.2s, box-shadow 0.3s;
        }

        input[type="submit"]:hover {
            box-shadow: 0 4px 15px rgba(42, 82, 152, 0.5);
            transform: translateY(-3px);
        }

        a {
            color: #2a5298;
            text-decoration: none;
            font-size: 14px;
        }

        a:hover {
            text-decoration: underline;
        }

        .footer {
            background-color: #000;
            color: #fff;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Change Password</h1>
    </div>

    <div class="change-password-container">
        <h2>Update Your Password</h2>
        <form action="ChangePasswordServlet1" method="post">
            <input type="text" id="username" name="username" placeholder="Enter your username" required><br>
            <input type="password" id="old_password" name="old_password" placeholder="Enter your old password" required><br>
            <input type="password" id="new_password" name="new_password" placeholder="Enter your new password" required><br>
            <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm your new password" required><br>
            <input type="submit" value="Change Password">
        </form>
        <br>
        <p><a href="index.jsp">Back to Login</a></p>
    </div>

    <div class="footer">
        <p>&copy; 2024 LibraryPro. All rights reserved.</p>
    </div>
</body>
</html>
