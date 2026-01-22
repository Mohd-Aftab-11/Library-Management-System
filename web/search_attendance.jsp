<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
    <title>LibraryPro - Search Attendance</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f0f2f5; /* Light background color */
            font-family: 'Arial', sans-serif;
        }

        .header {
            background-color: #007bff; /* Bootstrap blue */
            color: #ffffff; /* White text */
            padding: 20px;
            text-align: center;
            border-bottom: 4px solid #0056b3; /* Darker blue border */
        }

        .attendance-search-container {
            background: #ffffff; /* White background for container */
            border-radius: 12px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            text-align: center;
        }

        .attendance-search-container h2 {
            color: #333; /* Dark text color for headings */
            margin-bottom: 20px;
        }

        .attendance-search-container form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .attendance-search-container label {
            font-weight: bold;
        }

        .attendance-search-container input[type="text"] {
            border: 1px solid #ccc; /* Light border for input */
            border-radius: 8px; /* Rounded corners */
            padding: 12px;
            width: 80%;
            margin-bottom: 20px;
            font-size: 16px;
        }

        .attendance-search-container input[type="submit"] {
            background-color: #007bff; /* Bootstrap blue button */
            border: none;
            color: #ffffff;
            padding: 12px 24px;
            border-radius: 8px; /* Rounded corners */
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .attendance-search-container input[type="submit"]:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        .footer {
            background-color: #007bff; /* Same blue for footer */
            color: #ffffff; /* White text */
            text-align: center;
            padding: 15px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .footer a {
            color: #ffffff;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Search Attendance</h1>
    </div>

    <div class="attendance-search-container">
        <h2>Enter Student Details to View Attendance</h2>
        <form action="SearchAttendanceServlet" method="post">
            <label for="student_roll_number">Student Roll Number:</label><br>
            <input type="text" id="student_roll_number" name="student_roll_number" placeholder="Enter roll number" required><br><br>
            
            <label for="student_name">Student Name:</label><br>
            <input type="text" id="student_name" name="student_name" placeholder="Enter student name" required><br><br>

            <input type="submit" value="Search Attendance">
        </form>
        <br>
        <p><a href="librarian_dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a></p>
    </div>

    <div class="footer">
        <p>&copy; 2024 LibraryPro. All rights reserved.</p>
    </div>
</body>
</html>
